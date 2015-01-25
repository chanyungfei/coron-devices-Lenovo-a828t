.class Lcom/android/server/ShutdownActivity$1;
.super Landroid/telephony/PhoneStateListener;
.source "ShutdownActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/ShutdownActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/ShutdownActivity;


# direct methods
.method constructor <init>(Lcom/android/server/ShutdownActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 68
    iput-object p1, p0, Lcom/android/server/ShutdownActivity$1;->this$0:Lcom/android/server/ShutdownActivity;

    invoke-direct {p0}, Landroid/telephony/PhoneStateListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onCallStateChanged(ILjava/lang/String;)V
    .locals 2
    .parameter "state"
    .parameter "incomingNumber"

    .prologue
    .line 72
    invoke-super {p0, p1, p2}, Landroid/telephony/PhoneStateListener;->onCallStateChanged(ILjava/lang/String;)V

    .line 74
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/android/server/ShutdownActivity$1;->this$0:Lcom/android/server/ShutdownActivity;

    #getter for: Lcom/android/server/ShutdownActivity;->mInitialCallState:I
    invoke-static {v0}, Lcom/android/server/ShutdownActivity;->access$000(Lcom/android/server/ShutdownActivity;)I

    move-result v0

    if-nez v0, :cond_0

    .line 76
    const/4 v0, 0x0

    sput-boolean v0, Lcom/android/server/ShutdownActivity;->isRunning:Z

    .line 77
    iget-object v0, p0, Lcom/android/server/ShutdownActivity$1;->this$0:Lcom/android/server/ShutdownActivity;

    #getter for: Lcom/android/server/ShutdownActivity;->mHandler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/android/server/ShutdownActivity;->access$100(Lcom/android/server/ShutdownActivity;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/ShutdownActivity$1;->this$0:Lcom/android/server/ShutdownActivity;

    iget-object v1, v1, Lcom/android/server/ShutdownActivity;->updateTimeTask:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 78
    iget-object v0, p0, Lcom/android/server/ShutdownActivity$1;->this$0:Lcom/android/server/ShutdownActivity;

    iget-object v1, p0, Lcom/android/server/ShutdownActivity$1;->this$0:Lcom/android/server/ShutdownActivity;

    #calls: Lcom/android/server/ShutdownActivity;->setPowerOffNotification(Landroid/content/Context;)V
    invoke-static {v0, v1}, Lcom/android/server/ShutdownActivity;->access$200(Lcom/android/server/ShutdownActivity;Landroid/content/Context;)V

    .line 79
    iget-object v0, p0, Lcom/android/server/ShutdownActivity$1;->this$0:Lcom/android/server/ShutdownActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 81
    :cond_0
    return-void
.end method
