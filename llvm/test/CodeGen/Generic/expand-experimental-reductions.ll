; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -expand-reductions -S | FileCheck %s
; Tests without a target which should expand all reductions
declare i64 @llvm.experimental.vector.reduce.add.i64.v2i64(<2 x i64>)
declare i64 @llvm.experimental.vector.reduce.mul.i64.v2i64(<2 x i64>)
declare i64 @llvm.experimental.vector.reduce.and.i64.v2i64(<2 x i64>)
declare i64 @llvm.experimental.vector.reduce.or.i64.v2i64(<2 x i64>)
declare i64 @llvm.experimental.vector.reduce.xor.i64.v2i64(<2 x i64>)

declare float @llvm.experimental.vector.reduce.fadd.f32.v4f32(float, <4 x float>)
declare float @llvm.experimental.vector.reduce.fmul.f32.v4f32(float, <4 x float>)

declare i64 @llvm.experimental.vector.reduce.smax.i64.v2i64(<2 x i64>)
declare i64 @llvm.experimental.vector.reduce.smin.i64.v2i64(<2 x i64>)
declare i64 @llvm.experimental.vector.reduce.umax.i64.v2i64(<2 x i64>)
declare i64 @llvm.experimental.vector.reduce.umin.i64.v2i64(<2 x i64>)

declare double @llvm.experimental.vector.reduce.fmax.f64.v2f64(<2 x double>)
declare double @llvm.experimental.vector.reduce.fmin.f64.v2f64(<2 x double>)


define i64 @add_i64(<2 x i64> %vec) {
; CHECK-LABEL: @add_i64(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[RDX_SHUF:%.*]] = shufflevector <2 x i64> [[VEC:%.*]], <2 x i64> undef, <2 x i32> <i32 1, i32 undef>
; CHECK-NEXT:    [[BIN_RDX:%.*]] = add <2 x i64> [[VEC]], [[RDX_SHUF]]
; CHECK-NEXT:    [[TMP0:%.*]] = extractelement <2 x i64> [[BIN_RDX]], i32 0
; CHECK-NEXT:    ret i64 [[TMP0]]
;
entry:
  %r = call i64 @llvm.experimental.vector.reduce.add.i64.v2i64(<2 x i64> %vec)
  ret i64 %r
}

define i64 @mul_i64(<2 x i64> %vec) {
; CHECK-LABEL: @mul_i64(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[RDX_SHUF:%.*]] = shufflevector <2 x i64> [[VEC:%.*]], <2 x i64> undef, <2 x i32> <i32 1, i32 undef>
; CHECK-NEXT:    [[BIN_RDX:%.*]] = mul <2 x i64> [[VEC]], [[RDX_SHUF]]
; CHECK-NEXT:    [[TMP0:%.*]] = extractelement <2 x i64> [[BIN_RDX]], i32 0
; CHECK-NEXT:    ret i64 [[TMP0]]
;
entry:
  %r = call i64 @llvm.experimental.vector.reduce.mul.i64.v2i64(<2 x i64> %vec)
  ret i64 %r
}

define i64 @and_i64(<2 x i64> %vec) {
; CHECK-LABEL: @and_i64(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[RDX_SHUF:%.*]] = shufflevector <2 x i64> [[VEC:%.*]], <2 x i64> undef, <2 x i32> <i32 1, i32 undef>
; CHECK-NEXT:    [[BIN_RDX:%.*]] = and <2 x i64> [[VEC]], [[RDX_SHUF]]
; CHECK-NEXT:    [[TMP0:%.*]] = extractelement <2 x i64> [[BIN_RDX]], i32 0
; CHECK-NEXT:    ret i64 [[TMP0]]
;
entry:
  %r = call i64 @llvm.experimental.vector.reduce.and.i64.v2i64(<2 x i64> %vec)
  ret i64 %r
}

define i64 @or_i64(<2 x i64> %vec) {
; CHECK-LABEL: @or_i64(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[RDX_SHUF:%.*]] = shufflevector <2 x i64> [[VEC:%.*]], <2 x i64> undef, <2 x i32> <i32 1, i32 undef>
; CHECK-NEXT:    [[BIN_RDX:%.*]] = or <2 x i64> [[VEC]], [[RDX_SHUF]]
; CHECK-NEXT:    [[TMP0:%.*]] = extractelement <2 x i64> [[BIN_RDX]], i32 0
; CHECK-NEXT:    ret i64 [[TMP0]]
;
entry:
  %r = call i64 @llvm.experimental.vector.reduce.or.i64.v2i64(<2 x i64> %vec)
  ret i64 %r
}

define i64 @xor_i64(<2 x i64> %vec) {
; CHECK-LABEL: @xor_i64(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[RDX_SHUF:%.*]] = shufflevector <2 x i64> [[VEC:%.*]], <2 x i64> undef, <2 x i32> <i32 1, i32 undef>
; CHECK-NEXT:    [[BIN_RDX:%.*]] = xor <2 x i64> [[VEC]], [[RDX_SHUF]]
; CHECK-NEXT:    [[TMP0:%.*]] = extractelement <2 x i64> [[BIN_RDX]], i32 0
; CHECK-NEXT:    ret i64 [[TMP0]]
;
entry:
  %r = call i64 @llvm.experimental.vector.reduce.xor.i64.v2i64(<2 x i64> %vec)
  ret i64 %r
}

define float @fadd_f32(<4 x float> %vec) {
; CHECK-LABEL: @fadd_f32(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[RDX_SHUF:%.*]] = shufflevector <4 x float> [[VEC:%.*]], <4 x float> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
; CHECK-NEXT:    [[BIN_RDX:%.*]] = fadd fast <4 x float> [[VEC]], [[RDX_SHUF]]
; CHECK-NEXT:    [[RDX_SHUF1:%.*]] = shufflevector <4 x float> [[BIN_RDX]], <4 x float> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
; CHECK-NEXT:    [[BIN_RDX2:%.*]] = fadd fast <4 x float> [[BIN_RDX]], [[RDX_SHUF1]]
; CHECK-NEXT:    [[TMP0:%.*]] = extractelement <4 x float> [[BIN_RDX2]], i32 0
; CHECK-NEXT:    ret float [[TMP0]]
;
entry:
  %r = call fast float @llvm.experimental.vector.reduce.fadd.f32.v4f32(float undef, <4 x float> %vec)
  ret float %r
}

define float @fadd_f32_strict(<4 x float> %vec) {
; CHECK-LABEL: @fadd_f32_strict(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[R:%.*]] = call float @llvm.experimental.vector.reduce.fadd.f32.f32.v4f32(float undef, <4 x float> [[VEC:%.*]])
; CHECK-NEXT:    ret float [[R]]
;
entry:
  %r = call float @llvm.experimental.vector.reduce.fadd.f32.v4f32(float undef, <4 x float> %vec)
  ret float %r
}

define float @fadd_f32_strict_accum(float %accum, <4 x float> %vec) {
; CHECK-LABEL: @fadd_f32_strict_accum(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[R:%.*]] = call float @llvm.experimental.vector.reduce.fadd.f32.f32.v4f32(float [[ACCUM:%.*]], <4 x float> [[VEC:%.*]])
; CHECK-NEXT:    ret float [[R]]
;
entry:
  %r = call float @llvm.experimental.vector.reduce.fadd.f32.v4f32(float %accum, <4 x float> %vec)
  ret float %r
}

define float @fmul_f32(<4 x float> %vec) {
; CHECK-LABEL: @fmul_f32(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[RDX_SHUF:%.*]] = shufflevector <4 x float> [[VEC:%.*]], <4 x float> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
; CHECK-NEXT:    [[BIN_RDX:%.*]] = fmul fast <4 x float> [[VEC]], [[RDX_SHUF]]
; CHECK-NEXT:    [[RDX_SHUF1:%.*]] = shufflevector <4 x float> [[BIN_RDX]], <4 x float> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
; CHECK-NEXT:    [[BIN_RDX2:%.*]] = fmul fast <4 x float> [[BIN_RDX]], [[RDX_SHUF1]]
; CHECK-NEXT:    [[TMP0:%.*]] = extractelement <4 x float> [[BIN_RDX2]], i32 0
; CHECK-NEXT:    ret float [[TMP0]]
;
entry:
  %r = call fast float @llvm.experimental.vector.reduce.fmul.f32.v4f32(float undef, <4 x float> %vec)
  ret float %r
}

define float @fmul_f32_strict(<4 x float> %vec) {
; CHECK-LABEL: @fmul_f32_strict(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[R:%.*]] = call float @llvm.experimental.vector.reduce.fmul.f32.f32.v4f32(float undef, <4 x float> [[VEC:%.*]])
; CHECK-NEXT:    ret float [[R]]
;
entry:
  %r = call float @llvm.experimental.vector.reduce.fmul.f32.v4f32(float undef, <4 x float> %vec)
  ret float %r
}

define float @fmul_f32_strict_accum(float %accum, <4 x float> %vec) {
; CHECK-LABEL: @fmul_f32_strict_accum(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[R:%.*]] = call float @llvm.experimental.vector.reduce.fmul.f32.f32.v4f32(float [[ACCUM:%.*]], <4 x float> [[VEC:%.*]])
; CHECK-NEXT:    ret float [[R]]
;
entry:
  %r = call float @llvm.experimental.vector.reduce.fmul.f32.v4f32(float %accum, <4 x float> %vec)
  ret float %r
}

define i64 @smax_i64(<2 x i64> %vec) {
; CHECK-LABEL: @smax_i64(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[RDX_SHUF:%.*]] = shufflevector <2 x i64> [[VEC:%.*]], <2 x i64> undef, <2 x i32> <i32 1, i32 undef>
; CHECK-NEXT:    [[RDX_MINMAX_CMP:%.*]] = icmp sgt <2 x i64> [[VEC]], [[RDX_SHUF]]
; CHECK-NEXT:    [[RDX_MINMAX_SELECT:%.*]] = select <2 x i1> [[RDX_MINMAX_CMP]], <2 x i64> [[VEC]], <2 x i64> [[RDX_SHUF]]
; CHECK-NEXT:    [[TMP0:%.*]] = extractelement <2 x i64> [[RDX_MINMAX_SELECT]], i32 0
; CHECK-NEXT:    ret i64 [[TMP0]]
;
entry:
  %r = call i64 @llvm.experimental.vector.reduce.smax.i64.v2i64(<2 x i64> %vec)
  ret i64 %r
}

define i64 @smin_i64(<2 x i64> %vec) {
; CHECK-LABEL: @smin_i64(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[RDX_SHUF:%.*]] = shufflevector <2 x i64> [[VEC:%.*]], <2 x i64> undef, <2 x i32> <i32 1, i32 undef>
; CHECK-NEXT:    [[RDX_MINMAX_CMP:%.*]] = icmp slt <2 x i64> [[VEC]], [[RDX_SHUF]]
; CHECK-NEXT:    [[RDX_MINMAX_SELECT:%.*]] = select <2 x i1> [[RDX_MINMAX_CMP]], <2 x i64> [[VEC]], <2 x i64> [[RDX_SHUF]]
; CHECK-NEXT:    [[TMP0:%.*]] = extractelement <2 x i64> [[RDX_MINMAX_SELECT]], i32 0
; CHECK-NEXT:    ret i64 [[TMP0]]
;
entry:
  %r = call i64 @llvm.experimental.vector.reduce.smin.i64.v2i64(<2 x i64> %vec)
  ret i64 %r
}

define i64 @umax_i64(<2 x i64> %vec) {
; CHECK-LABEL: @umax_i64(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[RDX_SHUF:%.*]] = shufflevector <2 x i64> [[VEC:%.*]], <2 x i64> undef, <2 x i32> <i32 1, i32 undef>
; CHECK-NEXT:    [[RDX_MINMAX_CMP:%.*]] = icmp ugt <2 x i64> [[VEC]], [[RDX_SHUF]]
; CHECK-NEXT:    [[RDX_MINMAX_SELECT:%.*]] = select <2 x i1> [[RDX_MINMAX_CMP]], <2 x i64> [[VEC]], <2 x i64> [[RDX_SHUF]]
; CHECK-NEXT:    [[TMP0:%.*]] = extractelement <2 x i64> [[RDX_MINMAX_SELECT]], i32 0
; CHECK-NEXT:    ret i64 [[TMP0]]
;
entry:
  %r = call i64 @llvm.experimental.vector.reduce.umax.i64.v2i64(<2 x i64> %vec)
  ret i64 %r
}

define i64 @umin_i64(<2 x i64> %vec) {
; CHECK-LABEL: @umin_i64(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[RDX_SHUF:%.*]] = shufflevector <2 x i64> [[VEC:%.*]], <2 x i64> undef, <2 x i32> <i32 1, i32 undef>
; CHECK-NEXT:    [[RDX_MINMAX_CMP:%.*]] = icmp ult <2 x i64> [[VEC]], [[RDX_SHUF]]
; CHECK-NEXT:    [[RDX_MINMAX_SELECT:%.*]] = select <2 x i1> [[RDX_MINMAX_CMP]], <2 x i64> [[VEC]], <2 x i64> [[RDX_SHUF]]
; CHECK-NEXT:    [[TMP0:%.*]] = extractelement <2 x i64> [[RDX_MINMAX_SELECT]], i32 0
; CHECK-NEXT:    ret i64 [[TMP0]]
;
entry:
  %r = call i64 @llvm.experimental.vector.reduce.umin.i64.v2i64(<2 x i64> %vec)
  ret i64 %r
}

define double @fmax_f64(<2 x double> %vec) {
; CHECK-LABEL: @fmax_f64(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[RDX_SHUF:%.*]] = shufflevector <2 x double> [[VEC:%.*]], <2 x double> undef, <2 x i32> <i32 1, i32 undef>
; CHECK-NEXT:    [[RDX_MINMAX_CMP:%.*]] = fcmp fast ogt <2 x double> [[VEC]], [[RDX_SHUF]]
; CHECK-NEXT:    [[RDX_MINMAX_SELECT:%.*]] = select <2 x i1> [[RDX_MINMAX_CMP]], <2 x double> [[VEC]], <2 x double> [[RDX_SHUF]]
; CHECK-NEXT:    [[TMP0:%.*]] = extractelement <2 x double> [[RDX_MINMAX_SELECT]], i32 0
; CHECK-NEXT:    ret double [[TMP0]]
;
entry:
  %r = call double @llvm.experimental.vector.reduce.fmax.f64.v2f64(<2 x double> %vec)
  ret double %r
}

define double @fmin_f64(<2 x double> %vec) {
; CHECK-LABEL: @fmin_f64(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[RDX_SHUF:%.*]] = shufflevector <2 x double> [[VEC:%.*]], <2 x double> undef, <2 x i32> <i32 1, i32 undef>
; CHECK-NEXT:    [[RDX_MINMAX_CMP:%.*]] = fcmp fast olt <2 x double> [[VEC]], [[RDX_SHUF]]
; CHECK-NEXT:    [[RDX_MINMAX_SELECT:%.*]] = select <2 x i1> [[RDX_MINMAX_CMP]], <2 x double> [[VEC]], <2 x double> [[RDX_SHUF]]
; CHECK-NEXT:    [[TMP0:%.*]] = extractelement <2 x double> [[RDX_MINMAX_SELECT]], i32 0
; CHECK-NEXT:    ret double [[TMP0]]
;
entry:
  %r = call double @llvm.experimental.vector.reduce.fmin.f64.v2f64(<2 x double> %vec)
  ret double %r
}
