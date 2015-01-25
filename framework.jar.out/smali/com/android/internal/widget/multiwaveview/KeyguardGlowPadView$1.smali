.class Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "KeyguardGlowPadView.java"


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
    .line 171
    iput-object p1, p0, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView$1;->this$0:Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 4
    .parameter "animator"

    .prologue
    .line 173
    iget-object v0, p0, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView$1;->this$0:Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView$1;->this$0:Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;

    #getter for: Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;->mWaveCenterX:F
    invoke-static {v2}, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;->access$100(Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;)F

    move-result v2

    iget-object v3, p0, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView$1;->this$0:Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;

    #getter for: Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;->mWaveCenterY:F
    invoke-static {v3}, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;->access$200(Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;)F

    move-result v3

    #calls: Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;->switchToState(IFF)V
    invoke-static {v0, v1, v2, v3}, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;->access$300(Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;IFF)V

    .line 174
    iget-object v0, p0, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView$1;->this$0:Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;

    #calls: Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;->dispatchOnFinishFinalAnimation()V
    invoke-static {v0}, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;->access$400(Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;)V

    .line 175
    return-void
.end method
