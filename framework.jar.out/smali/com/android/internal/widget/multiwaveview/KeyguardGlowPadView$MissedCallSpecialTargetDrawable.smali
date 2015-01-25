.class Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView$MissedCallSpecialTargetDrawable;
.super Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView$AbstractSpecialTargetDrawable;
.source "KeyguardGlowPadView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MissedCallSpecialTargetDrawable"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;


# direct methods
.method public constructor <init>(Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;Landroid/content/res/Resources;)V
    .locals 0
    .parameter
    .parameter "res"

    .prologue
    .line 1500
    iput-object p1, p0, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView$MissedCallSpecialTargetDrawable;->this$0:Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;

    .line 1501
    invoke-direct {p0, p1, p2}, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView$AbstractSpecialTargetDrawable;-><init>(Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;Landroid/content/res/Resources;)V

    .line 1503
    return-void
.end method


# virtual methods
.method protected getCount()I
    .locals 1

    .prologue
    .line 1508
    iget-object v0, p0, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView$MissedCallSpecialTargetDrawable;->this$0:Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;

    #getter for: Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;->mMissedCall:I
    invoke-static {v0}, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;->access$1100(Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;)I

    move-result v0

    return v0
.end method
