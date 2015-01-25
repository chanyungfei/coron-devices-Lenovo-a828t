.class Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$6$1;
.super Ljava/lang/Object;
.source "KeyguardSimPinView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$6;->onSimCheckResponse(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$6;

.field final synthetic val$success:Z


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$6;Z)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 238
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$6$1;->this$1:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$6;

    iput-boolean p2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$6$1;->val$success:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    const/4 v1, 0x1

    const/4 v3, 0x0

    .line 240
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$6$1;->this$1:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$6;

    iget-object v0, v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$6;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;

    #getter for: Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;->mSimUnlockProgressDialog:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;->access$000(Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;)Landroid/app/ProgressDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 241
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$6$1;->this$1:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$6;

    iget-object v0, v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$6;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;

    #getter for: Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;->mSimUnlockProgressDialog:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;->access$000(Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->hide()V

    .line 243
    :cond_0
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$6$1;->val$success:Z

    if-eqz v0, :cond_1

    .line 246
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$6$1;->this$1:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$6;

    iget-object v0, v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$6;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;->getInstance(Landroid/content/Context;)Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;->reportSimUnlocked()V

    .line 247
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$6$1;->this$1:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$6;

    iget-object v0, v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$6;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;

    iget-object v0, v0, Lcom/android/internal/policy/impl/keyguard/KeyguardAbsKeyInputView;->mCallback:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityCallback;

    invoke-interface {v0, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityCallback;->dismiss(Z)V

    .line 248
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$6$1;->this$1:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$6;

    iget-object v0, v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$6;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    #setter for: Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;->mUserEnteredWrongPin:Ljava/lang/Boolean;
    invoke-static {v0, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;->access$202(Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    .line 255
    :goto_0
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$6$1;->this$1:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$6;

    iget-object v0, v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$6;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;

    iget-object v0, v0, Lcom/android/internal/policy/impl/keyguard/KeyguardAbsKeyInputView;->mCallback:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityCallback;

    const-wide/16 v1, 0x0

    invoke-interface {v0, v1, v2}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityCallback;->userActivity(J)V

    .line 256
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$6$1;->this$1:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$6;

    iget-object v0, v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$6;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;

    #setter for: Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;->mSimCheckInProgress:Z
    invoke-static {v0, v3}, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;->access$502(Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;Z)Z

    .line 257
    return-void

    .line 250
    :cond_1
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$6$1;->this$1:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$6;

    iget-object v0, v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$6;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    #setter for: Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;->mUserEnteredWrongPin:Ljava/lang/Boolean;
    invoke-static {v0, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;->access$202(Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    .line 253
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$6$1;->this$1:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$6;

    iget-object v0, v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView$6;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinView;

    iget-object v0, v0, Lcom/android/internal/policy/impl/keyguard/KeyguardAbsKeyInputView;->mPasswordEntry:Landroid/widget/TextView;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method
