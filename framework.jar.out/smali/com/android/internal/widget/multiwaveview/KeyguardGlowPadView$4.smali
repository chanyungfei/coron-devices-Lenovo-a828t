.class Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView$4;
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
    .line 193
    iput-object p1, p0, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView$4;->this$0:Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3
    .parameter "animator"

    .prologue
    const/4 v2, 0x0

    .line 195
    iget-object v0, p0, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView$4;->this$0:Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;

    #getter for: Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;->mNewTargetResources:I
    invoke-static {v0}, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;->access$500(Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;)I

    move-result v0

    if-eqz v0, :cond_0

    .line 196
    iget-object v0, p0, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView$4;->this$0:Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;

    iget-object v1, p0, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView$4;->this$0:Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;

    #getter for: Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;->mNewTargetResources:I
    invoke-static {v1}, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;->access$500(Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;)I

    move-result v1

    #calls: Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;->internalSetTargetResources(I)V
    invoke-static {v0, v1}, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;->access$600(Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;I)V

    .line 197
    iget-object v0, p0, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView$4;->this$0:Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;

    #setter for: Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;->mNewTargetResources:I
    invoke-static {v0, v2}, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;->access$502(Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;I)I

    .line 198
    iget-object v0, p0, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView$4;->this$0:Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;

    #calls: Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;->hideTargets(ZZ)V
    invoke-static {v0, v2, v2}, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;->access$700(Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;ZZ)V

    .line 200
    :cond_0
    iget-object v0, p0, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView$4;->this$0:Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;

    #setter for: Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;->mAnimatingTargets:Z
    invoke-static {v0, v2}, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;->access$802(Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;Z)Z

    .line 201
    return-void
.end method
