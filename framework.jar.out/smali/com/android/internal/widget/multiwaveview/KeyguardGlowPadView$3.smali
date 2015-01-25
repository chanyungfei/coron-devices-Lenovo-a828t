.class Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView$3;
.super Ljava/lang/Object;
.source "KeyguardGlowPadView.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;


# direct methods
.method constructor <init>(Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;)V
    .locals 0
    .parameter

    .prologue
    .line 186
    iput-object p1, p0, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView$3;->this$0:Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1
    .parameter "animation"

    .prologue
    .line 188
    iget-object v0, p0, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView$3;->this$0:Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;

    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    .line 189
    return-void
.end method
