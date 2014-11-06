# global beforeEach, describe, it, assert, expect
"use strict"

describe 'Primes Collection', ->
  beforeEach ->
    @PrimesCollection = new Mccluskyfrontend.Collections.Primes()
