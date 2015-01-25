.class Lcom/android/server/ShutdownActivity$3;
.super Ljava/lang/Object;
.source "ShutdownActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


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
    .line 190
    iput-object p1, p0, Lcom/android/server/ShutdownActivity$3;->this$0:Lcom/android/server/ShutdownActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 192
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    invoke-static {}, Lcom/android/server/ShutdownActivity;->access$500()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-gez v0, :cond_1

    .line 193
    iget-object v0, p0, Lcom/android/server/ShutdownActivity$3;->this$0:Lcom/android/server/ShutdownActivity;

    invoke-static {}, Lcom/android/server/ShutdownActivity;->access$600()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->showDialog(I)V

    .line 194
    iget-object v0, p0, Lcom/android/server/ShutdownActivity$3;->this$0:Lcom/android/server/ShutdownActivity;

    #getter for: Lcom/android/server/ShutdownActivity;->mHandler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/android/server/ShutdownActivity;->access$100(Lcom/android/server/ShutdownActivity;)Landroid/os/Handler;

    move-result-object v0

    const-wide/16 v1, 0x3e8

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 208
    :cond_0
    :goto_0
    return-void

    .line 196
    :cond_1
    iget-object v0, p0, Lcom/android/server/ShutdownActivity$3;->this$0:Lcom/android/server/ShutdownActivity;

    invoke-static {}, Lcom/android/server/ShutdownActivity;->access$600()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->removeDialog(I)V

    .line 197
    invoke-static {}, Lcom/android/server/ShutdownActivity;->access$600()I

    move-result v0

    const/16 v1, 0x66

    if-ne v0, v1, :cond_2

    .line 198
    const-string v0, "ShutdownActivity"

    const-string v1, "COUNTDOWN_POWER_OFF timeout!!!"

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 199
    iget-object v0, p0, Lcom/android/server/ShutdownActivity$3;->this$0:Lcom/android/server/ShutdownActivity;

    invoke-static {v0, v4}, Lcom/android/server/power/ShutdownThread;->shutdown(Landroid/content/Context;Z)V

    goto :goto_0

    .line 200
    :cond_2
    invoke-static {}, Lcom/android/server/ShutdownActivity;->access$600()I

    move-result v0

    const/16 v1, 0x65

    if-ne v0, v1, :cond_3

    .line 201
    const-string v0, "ShutdownActivity"

    const-string v1, "COUNTDOWN_POWER_ON timeout!!!"

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 202
    iget-object v0, p0, Lcom/android/server/ShutdownActivity$3;->this$0:Lcom/android/server/ShutdownActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    goto :goto_0

    .line 203
    :cond_3
    invoke-static {}, Lcom/android/server/ShutdownActivity;->access$600()I

    move-result v0

    const/16 v1, 0x67

    if-ne v0, v1, :cond_0

    .line 204
    const-string v0, "ShutdownActivity"

    const-string v1, "COUNTDOWN_REBOOT timeout!!!"

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    iget-object v0, p0, Lcom/android/server/ShutdownActivity$3;->this$0:Lcom/android/server/ShutdownActivity;

    const-string v1, "reboot"

    invoke-static {v0, v1, v4}, Lcom/android/server/power/ShutdownThread;->reboot(Landroid/content/Context;Ljava/lang/String;Z)V

    goto :goto_0
.end method
