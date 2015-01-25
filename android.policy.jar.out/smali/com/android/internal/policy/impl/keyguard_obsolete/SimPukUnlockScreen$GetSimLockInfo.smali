.class abstract Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen$GetSimLockInfo;
.super Ljava/lang/Thread;
.source "SimPukUnlockScreen.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "GetSimLockInfo"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen;


# direct methods
.method protected constructor <init>(Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen;)V
    .locals 0
    .parameter

    .prologue
    .line 152
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen$GetSimLockInfo;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method abstract onSimLockInfoResponse([I)V
.end method

.method public run()V
    .locals 4

    .prologue
    .line 158
    :try_start_0
    const-string v2, "phone"

    invoke-static {v2}, Landroid/os/ServiceManager;->checkService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/telephony/ITelephony$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ITelephony;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/internal/telephony/ITelephony;->getSimLockInfo()[I

    move-result-object v1

    .line 161
    .local v1, result:[I
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen$GetSimLockInfo;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen;

    new-instance v3, Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen$GetSimLockInfo$1;

    invoke-direct {v3, p0, v1}, Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen$GetSimLockInfo$1;-><init>(Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen$GetSimLockInfo;[I)V

    invoke-virtual {v2, v3}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 173
    .end local v1           #result:[I
    :goto_0
    return-void

    .line 166
    :catch_0
    move-exception v0

    .line 167
    .local v0, e:Landroid/os/RemoteException;
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen$GetSimLockInfo;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen;

    new-instance v3, Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen$GetSimLockInfo$2;

    invoke-direct {v3, p0}, Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen$GetSimLockInfo$2;-><init>(Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen$GetSimLockInfo;)V

    invoke-virtual {v2, v3}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method
