.class abstract Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView$AbstractSpecialTargetDrawable;
.super Lcom/android/internal/widget/multiwaveview/TargetDrawable;
.source "KeyguardGlowPadView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "AbstractSpecialTargetDrawable"
.end annotation


# instance fields
.field resId:I

.field final synthetic this$0:Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;


# direct methods
.method public constructor <init>(Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;Landroid/content/res/Resources;)V
    .locals 1
    .parameter
    .parameter "res"

    .prologue
    const/4 v0, 0x0

    .line 1515
    iput-object p1, p0, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView$AbstractSpecialTargetDrawable;->this$0:Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;

    .line 1516
    invoke-direct {p0, p2, v0}, Lcom/android/internal/widget/multiwaveview/TargetDrawable;-><init>(Landroid/content/res/Resources;I)V

    .line 1514
    iput v0, p0, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView$AbstractSpecialTargetDrawable;->resId:I

    .line 1517
    return-void
.end method


# virtual methods
.method protected abstract getCount()I
.end method

.method public getSpecialTargetResId()I
    .locals 2

    .prologue
    .line 1523
    invoke-virtual {p0}, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView$AbstractSpecialTargetDrawable;->getCount()I

    move-result v0

    if-nez v0, :cond_0

    .line 1557
    :goto_0
    iget v0, p0, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView$AbstractSpecialTargetDrawable;->resId:I

    return v0

    .line 1524
    :cond_0
    invoke-virtual {p0}, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView$AbstractSpecialTargetDrawable;->getCount()I

    move-result v0

    const/16 v1, 0x9

    if-le v0, v1, :cond_1

    .line 1525
    const v0, 0x1080107

    iput v0, p0, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView$AbstractSpecialTargetDrawable;->resId:I

    goto :goto_0

    .line 1527
    :cond_1
    invoke-virtual {p0}, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView$AbstractSpecialTargetDrawable;->getCount()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 1529
    :pswitch_0
    const v0, 0x108009e

    iput v0, p0, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView$AbstractSpecialTargetDrawable;->resId:I

    goto :goto_0

    .line 1532
    :pswitch_1
    const v0, 0x108009f

    iput v0, p0, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView$AbstractSpecialTargetDrawable;->resId:I

    goto :goto_0

    .line 1535
    :pswitch_2
    const v0, 0x1080100

    iput v0, p0, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView$AbstractSpecialTargetDrawable;->resId:I

    goto :goto_0

    .line 1538
    :pswitch_3
    const v0, 0x1080101

    iput v0, p0, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView$AbstractSpecialTargetDrawable;->resId:I

    goto :goto_0

    .line 1541
    :pswitch_4
    const v0, 0x1080102

    iput v0, p0, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView$AbstractSpecialTargetDrawable;->resId:I

    goto :goto_0

    .line 1544
    :pswitch_5
    const v0, 0x1080103

    iput v0, p0, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView$AbstractSpecialTargetDrawable;->resId:I

    goto :goto_0

    .line 1547
    :pswitch_6
    const v0, 0x1080104

    iput v0, p0, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView$AbstractSpecialTargetDrawable;->resId:I

    goto :goto_0

    .line 1550
    :pswitch_7
    const v0, 0x1080105

    iput v0, p0, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView$AbstractSpecialTargetDrawable;->resId:I

    goto :goto_0

    .line 1553
    :pswitch_8
    const v0, 0x1080106

    iput v0, p0, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView$AbstractSpecialTargetDrawable;->resId:I

    goto :goto_0

    .line 1527
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
    .end packed-switch
.end method
