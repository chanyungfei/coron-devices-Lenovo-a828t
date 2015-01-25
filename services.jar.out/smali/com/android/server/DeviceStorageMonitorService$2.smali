.class Lcom/android/server/DeviceStorageMonitorService$2;
.super Ljava/lang/Thread;
.source "DeviceStorageMonitorService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/DeviceStorageMonitorService;->fillReserveData()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/DeviceStorageMonitorService;


# direct methods
.method constructor <init>(Lcom/android/server/DeviceStorageMonitorService;)V
    .locals 0
    .parameter

    .prologue
    .line 711
    iput-object p1, p0, Lcom/android/server/DeviceStorageMonitorService$2;->this$0:Lcom/android/server/DeviceStorageMonitorService;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 15

    .prologue
    const-wide/32 v13, 0x200000

    .line 715
    :try_start_0
    new-instance v8, Landroid/os/StatFs;

    const-string v9, "/data"

    invoke-direct {v8, v9}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 716
    .local v8, stat:Landroid/os/StatFs;
    invoke-virtual {v8}, Landroid/os/StatFs;->getBlockSize()I

    move-result v0

    .line 717
    .local v0, blockSize:I
    const-wide/32 v9, 0x200000

    int-to-long v11, v0

    div-long v6, v9, v11

    .line 718
    .local v6, noOfBlockToFill:J
    new-instance v3, Ljava/io/FileOutputStream;

    const-string v9, "/data/reservedata"

    const/4 v10, 0x1

    invoke-direct {v3, v9, v10}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;Z)V

    .line 719
    .local v3, fs:Ljava/io/FileOutputStream;
    new-array v1, v0, [B

    .line 720
    .local v1, buf:[B
    const-wide/16 v4, 0x0

    .local v4, i:J
    :goto_0
    cmp-long v9, v4, v6

    if-gez v9, :cond_0

    .line 721
    invoke-virtual {v3, v1}, Ljava/io/OutputStream;->write([B)V

    .line 722
    invoke-virtual {v3}, Ljava/io/OutputStream;->flush()V

    .line 720
    const-wide/16 v9, 0x1

    add-long/2addr v4, v9

    goto :goto_0

    .line 724
    :cond_0
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 730
    iget-object v9, p0, Lcom/android/server/DeviceStorageMonitorService$2;->this$0:Lcom/android/server/DeviceStorageMonitorService;

    #setter for: Lcom/android/server/DeviceStorageMonitorService;->mReserveMem:J
    invoke-static {v9, v13, v14}, Lcom/android/server/DeviceStorageMonitorService;->access$702(Lcom/android/server/DeviceStorageMonitorService;J)J

    .line 732
    iget-object v9, p0, Lcom/android/server/DeviceStorageMonitorService$2;->this$0:Lcom/android/server/DeviceStorageMonitorService;

    const/4 v10, 0x0

    const-wide/16 v11, 0x0

    #calls: Lcom/android/server/DeviceStorageMonitorService;->postCheckMemoryMsg(ZJ)V
    invoke-static {v9, v10, v11, v12}, Lcom/android/server/DeviceStorageMonitorService;->access$600(Lcom/android/server/DeviceStorageMonitorService;ZJ)V

    .line 733
    .end local v0           #blockSize:I
    .end local v1           #buf:[B
    .end local v3           #fs:Ljava/io/FileOutputStream;
    .end local v4           #i:J
    .end local v6           #noOfBlockToFill:J
    .end local v8           #stat:Landroid/os/StatFs;
    :goto_1
    return-void

    .line 725
    :catch_0
    move-exception v2

    .line 726
    .local v2, e:Ljava/lang/Exception;
    const-string v9, "DeviceStorageMonitorService"

    invoke-virtual {v2}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method
