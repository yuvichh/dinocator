package alloc

import "core:mem"

Arena :: struct {
    data: ^u8,
    size: int,
    offset: int,
}

arena_init :: proc(a: ^Arena, size: int) {
  ptr,err := mem.alloc(size)
  if err != nil {
        return
    }
  a.data = cast(^u8)ptr
  a.size = size
  a.offset = 0
  
}

arena_alloc :: proc(a: ^Arena,size: int) -> ^u8{
  if a.offset + size > a.size {
    return nil
  }
  
  base := uintptr(a.data)
  addr := base + uintptr(a.offset)
  ptr := cast(^u8)addr

  a.offset += size

  return ptr

}
arena_reset :: proc(a: ^Arena) {
  a.offset = 0
}
arena_free :: proc(a: ^Arena) {
  mem.free(a.data)

  a.data = nil
  a.size = 0
  a.offset = 0
}
