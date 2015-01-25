.class abstract Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$GetSimLockInfo;
.super Ljava/lang/Thread;
.source "SimUnlockScreen.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "GetSimLockInfo"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;


# direct methods
.method protected constructor <init>(Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;)V
    .locals 0
    .parameter

    .prologue
    .line 166
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$GetSimLockInfo;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 171
    :try_start_0
    const-string v3, "phone"

    invoke-static {v3}, Landroid/os/ServiceManager;->checkService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v3

    invoke-static {v3}, Lcom/android/internal/telephony/ITelephony$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ITelephony;

    move-result-object v3

    invoke-interface {v3}, Lcom/android/internal/telephony/ITelephony;->getSimLockInfo()[I

    move-result-object v2

    .line 173
    .local v2, result:[I
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v1

    .line 174
    .local v1, msg:Landroid/os/Message;
    const/4 v3, 0x1

    iput v3, v1, Landroid/os/Message;->what:I

    .line 175
    iput-object v2, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 176
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$GetSimLockInfo;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;

    iget-object v3, v3, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;->h:Landroid/os/Handler;

    invoke-virtual {v3, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 183
    .end local v2           #result:[I
    :goto_0
    return-void

    .line 177
    .end local v1           #msg:Landroid/os/Message;
    :catch_0
    move-exception v0

    .line 178
    .local v0, e:Landroid/os/RemoteException;
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v1

    .line 179
    .restart local v1       #msg:Landroid/os/Message;
    iput v4, v1, Landroid/os/Message;->what:I

    .line 180
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$GetSimLockInfo;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;->mSimRetryStat:[I
    invoke-static {v3}, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;->access$100(Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;)[I

    move-result-object v3

    iput-object v3, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 181
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$GetSimLockInfo;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;

    iget-object v3, v3, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;->h:Landroid/os/Handler;

    invoke-virtual {v3, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0
.end method
