.class Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen$GetSimLockInfo$2;
.super Ljava/lang/Object;
.source "SimPukUnlockScreen.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen$GetSimLockInfo;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen$GetSimLockInfo;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen$GetSimLockInfo;)V
    .locals 0
    .parameter

    .prologue
    .line 167
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen$GetSimLockInfo$2;->this$1:Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen$GetSimLockInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 169
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen$GetSimLockInfo$2;->this$1:Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen$GetSimLockInfo;

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen$GetSimLockInfo$2;->this$1:Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen$GetSimLockInfo;

    iget-object v1, v1, Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen$GetSimLockInfo;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen;->mSimRetryStat:[I
    invoke-static {v1}, Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen;->access$100(Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen;)[I

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard_obsolete/SimPukUnlockScreen$GetSimLockInfo;->onSimLockInfoResponse([I)V

    .line 170
    return-void
.end method
