.class Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$6$1;
.super Ljava/lang/Object;
.source "KeyguardSimPukView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$6;->onSimLockChangedResponse(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$6;

.field final synthetic val$success:Z


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$6;Z)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 305
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$6$1;->this$1:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$6;

    iput-boolean p2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$6$1;->val$success:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 307
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$6$1;->this$1:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$6;

    iget-object v0, v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$6;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;

    #getter for: Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;->mSimUnlockProgressDialog:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;->access$100(Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;)Landroid/app/ProgressDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 308
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$6$1;->this$1:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$6;

    iget-object v0, v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$6;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;

    #getter for: Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;->mSimUnlockProgressDialog:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;->access$100(Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->hide()V

    .line 310
    :cond_0
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$6$1;->val$success:Z

    if-eqz v0, :cond_1

    .line 311
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$6$1;->this$1:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$6;

    iget-object v0, v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$6;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;

    iget-object v0, v0, Lcom/android/internal/policy/impl/keyguard/KeyguardAbsKeyInputView;->mCallback:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityCallback;

    invoke-interface {v0, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityCallback;->dismiss(Z)V

    .line 312
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$6$1;->this$1:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$6;

    iget-object v0, v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$6;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    #setter for: Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;->mUserEnteredWrongPuk:Ljava/lang/Boolean;
    invoke-static {v0, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;->access$302(Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    .line 318
    :goto_0
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$6$1;->this$1:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$6;

    iget-object v0, v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$6;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;

    #setter for: Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;->mCheckInProgress:Z
    invoke-static {v0, v2}, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;->access$1202(Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;Z)Z

    .line 319
    return-void

    .line 314
    :cond_1
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$6$1;->this$1:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$6;

    iget-object v0, v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$6;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    #setter for: Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;->mUserEnteredWrongPuk:Ljava/lang/Boolean;
    invoke-static {v0, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;->access$302(Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    .line 315
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$6$1;->this$1:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$6;

    iget-object v0, v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$6;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;

    #getter for: Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;->mStateMachine:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$StateMachine;
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;->access$1100(Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;)Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$StateMachine;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$StateMachine;->reset()V

    goto :goto_0
.end method
