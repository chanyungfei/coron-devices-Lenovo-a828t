.class Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$1;
.super Landroid/os/Handler;
.source "KeyguardSimPinView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;)V
    .locals 0
    .parameter

    .prologue
    .line 55
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$1;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 8
    .parameter "msg"

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 57
    iget v3, p1, Landroid/os/Message;->what:I

    if-ne v3, v6, :cond_1

    .line 58
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$1;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;

    #getter for: Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;->mSimUnlockProgressDialog:Landroid/app/ProgressDialog;
    invoke-static {v3}, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;->access$000(Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;)Landroid/app/ProgressDialog;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 59
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$1;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;

    #getter for: Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;->mSimUnlockProgressDialog:Landroid/app/ProgressDialog;
    invoke-static {v3}, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;->access$000(Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;)Landroid/app/ProgressDialog;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Dialog;->hide()V

    .line 61
    :cond_0
    iget-object v4, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$1;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;

    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, [I

    check-cast v3, [I

    #setter for: Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;->mSimRetryStat:[I
    invoke-static {v4, v3}, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;->access$102(Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;[I)[I

    .line 62
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$1;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;

    iget-object v1, v3, Lcom/android/internal/policy/impl/keyguard/KeyguardAbsKeyInputView;->mSecurityMessageDisplay:Lcom/android/internal/policy/impl/keyguard/SecurityMessageDisplay;

    check-cast v1, Lcom/android/internal/policy/impl/keyguard/KeyguardMessageArea$Helper;

    .line 63
    .local v1, kgmsghelper:Lcom/android/internal/policy/impl/keyguard/KeyguardMessageArea$Helper;
    iget-object v0, v1, Lcom/android/internal/policy/impl/keyguard/KeyguardMessageArea$Helper;->mMessageArea:Lcom/android/internal/policy/impl/keyguard/KeyguardMessageArea;

    .line 66
    .local v0, kgmsgArea:Lcom/android/internal/policy/impl/keyguard/KeyguardMessageArea;
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$1;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;

    #getter for: Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;->mUserEnteredWrongPin:Ljava/lang/Boolean;
    invoke-static {v3}, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;->access$200(Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-nez v3, :cond_2

    .line 67
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$1;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;

    #getter for: Landroid/view/View;->mContext:Landroid/content/Context;
    invoke-static {v3}, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;->access$300(Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;)Landroid/content/Context;

    move-result-object v3

    const v4, 0x1040535

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-array v4, v6, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$1;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;

    #getter for: Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;->mSimRetryStat:[I
    invoke-static {v5}, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;->access$100(Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;)[I

    move-result-object v5

    aget v5, v5, v7

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 68
    .local v2, updatedmsg:Ljava/lang/String;
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$1;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;

    iget-object v3, v3, Lcom/android/internal/policy/impl/keyguard/KeyguardAbsKeyInputView;->mSecurityMessageDisplay:Lcom/android/internal/policy/impl/keyguard/SecurityMessageDisplay;

    invoke-interface {v3, v2, v6}, Lcom/android/internal/policy/impl/keyguard/SecurityMessageDisplay;->setMessage(Ljava/lang/CharSequence;Z)V

    .line 73
    :goto_0
    invoke-virtual {p0, v6}, Landroid/os/Handler;->removeMessages(I)V

    .line 75
    .end local v0           #kgmsgArea:Lcom/android/internal/policy/impl/keyguard/KeyguardMessageArea;
    .end local v1           #kgmsghelper:Lcom/android/internal/policy/impl/keyguard/KeyguardMessageArea$Helper;
    .end local v2           #updatedmsg:Ljava/lang/String;
    :cond_1
    return-void

    .line 70
    .restart local v0       #kgmsgArea:Lcom/android/internal/policy/impl/keyguard/KeyguardMessageArea;
    .restart local v1       #kgmsghelper:Lcom/android/internal/policy/impl/keyguard/KeyguardMessageArea$Helper;
    :cond_2
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$1;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;

    #getter for: Landroid/view/View;->mContext:Landroid/content/Context;
    invoke-static {v3}, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;->access$400(Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;)Landroid/content/Context;

    move-result-object v3

    const v4, 0x104053c

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-array v4, v6, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$1;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;

    #getter for: Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;->mSimRetryStat:[I
    invoke-static {v5}, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;->access$100(Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;)[I

    move-result-object v5

    aget v5, v5, v7

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 71
    .restart local v2       #updatedmsg:Ljava/lang/String;
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$1;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;

    iget-object v3, v3, Lcom/android/internal/policy/impl/keyguard/KeyguardAbsKeyInputView;->mSecurityMessageDisplay:Lcom/android/internal/policy/impl/keyguard/SecurityMessageDisplay;

    invoke-interface {v3, v2, v6}, Lcom/android/internal/policy/impl/keyguard/SecurityMessageDisplay;->setMessage(Ljava/lang/CharSequence;Z)V

    goto :goto_0
.end method
