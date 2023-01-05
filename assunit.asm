section .data

global assunit_assert_equals_rdi_rsi:function

section .text

assunit_assert_equals_rdi_rsi:
    cmp rdi, rsi
    je _assert_equals_rdi_rsi_equal
    mov rax, 1
    ret
_assert_equals_rdi_rsi_equal:
    xor rax, rax
    ret