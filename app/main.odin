package main

import "core:fmt"
import "../alloc"

main :: proc() {
  arena := alloc.Arena{}
  alloc.arena_init(&arena, 1024)

  ptr1 := alloc.arena_alloc(&arena, 64)
  ptr2 := alloc.arena_alloc(&arena, 128)

  fmt.println(ptr1, ptr2)

  alloc.arena_reset(&arena)

  alloc.arena_free(&arena)
  fmt.println("Memory allocated and cleaned yoo")
}
