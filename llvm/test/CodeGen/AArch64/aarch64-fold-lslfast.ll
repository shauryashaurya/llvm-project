; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=aarch64-linux-gnu | FileCheck %s --check-prefixes=CHECK,CHECK0
; RUN: llc < %s -mtriple=aarch64-linux-gnu -mattr=+addr-lsl-fast | FileCheck %s --check-prefixes=CHECK,CHECK3

%struct.a = type [256 x i16]
%struct.b = type [256 x i32]
%struct.c = type [256 x i64]

declare void @foo()
define i16 @halfword(ptr %ctx, i32 %xor72) nounwind {
; CHECK0-LABEL: halfword:
; CHECK0:       // %bb.0:
; CHECK0-NEXT:    stp x30, x21, [sp, #-32]! // 16-byte Folded Spill
; CHECK0-NEXT:    // kill: def $w1 killed $w1 def $x1
; CHECK0-NEXT:    ubfx x8, x1, #9, #8
; CHECK0-NEXT:    stp x20, x19, [sp, #16] // 16-byte Folded Spill
; CHECK0-NEXT:    lsl x21, x8, #1
; CHECK0-NEXT:    mov x19, x0
; CHECK0-NEXT:    ldrh w20, [x0, x21]
; CHECK0-NEXT:    bl foo
; CHECK0-NEXT:    mov w0, w20
; CHECK0-NEXT:    strh w20, [x19, x21]
; CHECK0-NEXT:    ldp x20, x19, [sp, #16] // 16-byte Folded Reload
; CHECK0-NEXT:    ldp x30, x21, [sp], #32 // 16-byte Folded Reload
; CHECK0-NEXT:    ret
;
; CHECK3-LABEL: halfword:
; CHECK3:       // %bb.0:
; CHECK3-NEXT:    stp x30, x21, [sp, #-32]! // 16-byte Folded Spill
; CHECK3-NEXT:    // kill: def $w1 killed $w1 def $x1
; CHECK3-NEXT:    ubfx x21, x1, #9, #8
; CHECK3-NEXT:    stp x20, x19, [sp, #16] // 16-byte Folded Spill
; CHECK3-NEXT:    mov x19, x0
; CHECK3-NEXT:    ldrh w20, [x0, x21, lsl #1]
; CHECK3-NEXT:    bl foo
; CHECK3-NEXT:    mov w0, w20
; CHECK3-NEXT:    strh w20, [x19, x21, lsl #1]
; CHECK3-NEXT:    ldp x20, x19, [sp, #16] // 16-byte Folded Reload
; CHECK3-NEXT:    ldp x30, x21, [sp], #32 // 16-byte Folded Reload
; CHECK3-NEXT:    ret
  %shr81 = lshr i32 %xor72, 9
  %conv82 = zext i32 %shr81 to i64
  %idxprom83 = and i64 %conv82, 255
  %arrayidx86 = getelementptr inbounds %struct.a, ptr %ctx, i64 0, i64 %idxprom83
  %result = load i16, ptr %arrayidx86, align 2
  call void @foo()
  store i16 %result, ptr %arrayidx86, align 2
  ret i16 %result
}

define i32 @word(ptr %ctx, i32 %xor72) nounwind {
; CHECK0-LABEL: word:
; CHECK0:       // %bb.0:
; CHECK0-NEXT:    stp x30, x21, [sp, #-32]! // 16-byte Folded Spill
; CHECK0-NEXT:    // kill: def $w1 killed $w1 def $x1
; CHECK0-NEXT:    ubfx x8, x1, #9, #8
; CHECK0-NEXT:    stp x20, x19, [sp, #16] // 16-byte Folded Spill
; CHECK0-NEXT:    lsl x21, x8, #2
; CHECK0-NEXT:    mov x19, x0
; CHECK0-NEXT:    ldr w20, [x0, x21]
; CHECK0-NEXT:    bl foo
; CHECK0-NEXT:    mov w0, w20
; CHECK0-NEXT:    str w20, [x19, x21]
; CHECK0-NEXT:    ldp x20, x19, [sp, #16] // 16-byte Folded Reload
; CHECK0-NEXT:    ldp x30, x21, [sp], #32 // 16-byte Folded Reload
; CHECK0-NEXT:    ret
;
; CHECK3-LABEL: word:
; CHECK3:       // %bb.0:
; CHECK3-NEXT:    stp x30, x21, [sp, #-32]! // 16-byte Folded Spill
; CHECK3-NEXT:    // kill: def $w1 killed $w1 def $x1
; CHECK3-NEXT:    ubfx x21, x1, #9, #8
; CHECK3-NEXT:    stp x20, x19, [sp, #16] // 16-byte Folded Spill
; CHECK3-NEXT:    mov x19, x0
; CHECK3-NEXT:    ldr w20, [x0, x21, lsl #2]
; CHECK3-NEXT:    bl foo
; CHECK3-NEXT:    mov w0, w20
; CHECK3-NEXT:    str w20, [x19, x21, lsl #2]
; CHECK3-NEXT:    ldp x20, x19, [sp, #16] // 16-byte Folded Reload
; CHECK3-NEXT:    ldp x30, x21, [sp], #32 // 16-byte Folded Reload
; CHECK3-NEXT:    ret
  %shr81 = lshr i32 %xor72, 9
  %conv82 = zext i32 %shr81 to i64
  %idxprom83 = and i64 %conv82, 255
  %arrayidx86 = getelementptr inbounds %struct.b, ptr %ctx, i64 0, i64 %idxprom83
  %result = load i32, ptr %arrayidx86, align 4
  call void @foo()
  store i32 %result, ptr %arrayidx86, align 4
  ret i32 %result
}

define i64 @doubleword(ptr %ctx, i32 %xor72) nounwind {
; CHECK0-LABEL: doubleword:
; CHECK0:       // %bb.0:
; CHECK0-NEXT:    stp x30, x21, [sp, #-32]! // 16-byte Folded Spill
; CHECK0-NEXT:    // kill: def $w1 killed $w1 def $x1
; CHECK0-NEXT:    ubfx x8, x1, #9, #8
; CHECK0-NEXT:    stp x20, x19, [sp, #16] // 16-byte Folded Spill
; CHECK0-NEXT:    lsl x21, x8, #3
; CHECK0-NEXT:    mov x19, x0
; CHECK0-NEXT:    ldr x20, [x0, x21]
; CHECK0-NEXT:    bl foo
; CHECK0-NEXT:    mov x0, x20
; CHECK0-NEXT:    str x20, [x19, x21]
; CHECK0-NEXT:    ldp x20, x19, [sp, #16] // 16-byte Folded Reload
; CHECK0-NEXT:    ldp x30, x21, [sp], #32 // 16-byte Folded Reload
; CHECK0-NEXT:    ret
;
; CHECK3-LABEL: doubleword:
; CHECK3:       // %bb.0:
; CHECK3-NEXT:    stp x30, x21, [sp, #-32]! // 16-byte Folded Spill
; CHECK3-NEXT:    // kill: def $w1 killed $w1 def $x1
; CHECK3-NEXT:    ubfx x21, x1, #9, #8
; CHECK3-NEXT:    stp x20, x19, [sp, #16] // 16-byte Folded Spill
; CHECK3-NEXT:    mov x19, x0
; CHECK3-NEXT:    ldr x20, [x0, x21, lsl #3]
; CHECK3-NEXT:    bl foo
; CHECK3-NEXT:    mov x0, x20
; CHECK3-NEXT:    str x20, [x19, x21, lsl #3]
; CHECK3-NEXT:    ldp x20, x19, [sp, #16] // 16-byte Folded Reload
; CHECK3-NEXT:    ldp x30, x21, [sp], #32 // 16-byte Folded Reload
; CHECK3-NEXT:    ret
  %shr81 = lshr i32 %xor72, 9
  %conv82 = zext i32 %shr81 to i64
  %idxprom83 = and i64 %conv82, 255
  %arrayidx86 = getelementptr inbounds %struct.c, ptr %ctx, i64 0, i64 %idxprom83
  %result = load i64, ptr %arrayidx86, align 8
  call void @foo()
  store i64 %result, ptr %arrayidx86, align 8
  ret i64 %result
}

define i64 @multi_use_non_memory(i64 %a, i64 %b) {
; CHECK-LABEL: multi_use_non_memory:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    lsl x8, x0, #3
; CHECK-NEXT:    lsl x9, x1, #3
; CHECK-NEXT:    cmp x8, x9
; CHECK-NEXT:    b.lt .LBB3_2
; CHECK-NEXT:  // %bb.1: // %falsebb
; CHECK-NEXT:    csel x0, x8, x9, gt
; CHECK-NEXT:    ret
; CHECK-NEXT:  .LBB3_2: // %truebb
; CHECK-NEXT:    str x30, [sp, #-16]! // 8-byte Folded Spill
; CHECK-NEXT:    .cfi_def_cfa_offset 16
; CHECK-NEXT:    .cfi_offset w30, -16
; CHECK-NEXT:    bl foo
entry:
  %mul1 = shl i64 %a, 3
  %mul2 = shl i64 %b, 3
  %cmp = icmp slt i64 %mul1, %mul2
  br i1 %cmp, label %truebb, label %falsebb
truebb:
  tail call void @foo()
  unreachable
falsebb:
  %cmp2 = icmp sgt i64 %mul1, %mul2
  br i1 %cmp2, label %exitbb, label %endbb
exitbb:
 ret i64 %mul1
endbb:
 ret i64 %mul2
}

define i64 @gep3(ptr %p, i64 %b) {
; CHECK0-LABEL: gep3:
; CHECK0:       // %bb.0:
; CHECK0-NEXT:    lsl x9, x1, #3
; CHECK0-NEXT:    mov x8, x0
; CHECK0-NEXT:    ldr x0, [x0, x9]
; CHECK0-NEXT:    str x1, [x8, x9]
; CHECK0-NEXT:    ret
;
; CHECK3-LABEL: gep3:
; CHECK3:       // %bb.0:
; CHECK3-NEXT:    mov x8, x0
; CHECK3-NEXT:    ldr x0, [x0, x1, lsl #3]
; CHECK3-NEXT:    str x1, [x8, x1, lsl #3]
; CHECK3-NEXT:    ret
  %g = getelementptr inbounds i64, ptr %p, i64 %b
  %l = load i64, ptr %g
  store i64 %b, ptr %g
  ret i64 %l
}

define i128 @gep4(ptr %p, i128 %a, i64 %b) {
; CHECK-LABEL: gep4:
; CHECK:       // %bb.0:
; CHECK-NEXT:    add x8, x0, x4, lsl #4
; CHECK-NEXT:    ldp x0, x1, [x8]
; CHECK-NEXT:    stp x2, x3, [x8]
; CHECK-NEXT:    ret
  %g = getelementptr inbounds i128, ptr %p, i64 %b
  %l = load i128, ptr %g
  store i128 %a, ptr %g
  ret i128 %l
}

define i64 @addlsl3(i64 %a, i64 %b) {
; CHECK-LABEL: addlsl3:
; CHECK:       // %bb.0:
; CHECK-NEXT:    lsl x8, x0, #3
; CHECK-NEXT:    add x9, x1, x8
; CHECK-NEXT:    sub x8, x1, x8
; CHECK-NEXT:    eor x0, x9, x8
; CHECK-NEXT:    ret
  %x = shl i64 %a, 3
  %y = add i64 %b, %x
  %z = sub i64 %b, %x
  %r = xor i64 %y, %z
  ret i64 %r
}

define i64 @addlsl4(i64 %a, i64 %b) {
; CHECK-LABEL: addlsl4:
; CHECK:       // %bb.0:
; CHECK-NEXT:    lsl x8, x0, #4
; CHECK-NEXT:    add x9, x1, x8
; CHECK-NEXT:    sub x8, x1, x8
; CHECK-NEXT:    eor x0, x9, x8
; CHECK-NEXT:    ret
  %x = shl i64 %a, 4
  %y = add i64 %b, %x
  %z = sub i64 %b, %x
  %r = xor i64 %y, %z
  ret i64 %r
}
