.class public final Landroid/util/LogMan;
.super Ljava/lang/Object;
.source "LogMan.java"


# static fields
.field public static final LOGMAN_TAG_ANR:Ljava/lang/String; = "ANR"

.field public static final LOGMAN_TAG_CRASH:Ljava/lang/String; = "CRASH"

.field public static final LOGMAN_TAG_REBOOT:Ljava/lang/String; = "REBOOT"

.field public static final LOGMAN_TAG_SHUTDOWN:Ljava/lang/String; = "SHUTDOWN"

.field private static final LOG_FILE_MAX_LENGTH:J = 0x80000L

.field private static final LOG_FILE_NAME:Ljava/lang/String; = "/data/logman.txt"

.field private static final OLD_LOG_FILE_NAME:Ljava/lang/String; = "/data/logman_old.txt"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    return-void
.end method

.method public static anr(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 81
    const-string v0, "ANR"

    invoke-static {v0, p0}, Landroid/util/LogMan;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    return-void
.end method

.method public static crash(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 77
    const-string v0, "CRASH"

    invoke-static {v0, p0}, Landroid/util/LogMan;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    return-void
.end method

.method private static getCurrentTimeString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 93
    new-instance v0, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-direct {v0, v2, v3}, Ljava/util/Date;-><init>(J)V

    .line 94
    .local v0, date:Ljava/util/Date;
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string/jumbo v2, "yyyy-MM-dd HH:mm:ss"

    invoke-direct {v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 95
    .local v1, dateFormat:Ljava/text/SimpleDateFormat;
    invoke-virtual {v1, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static log(Ljava/lang/String;Ljava/lang/String;)V
    .locals 9
    .parameter "tag"
    .parameter "msg"

    .prologue
    .line 45
    :try_start_0
    new-instance v2, Ljava/io/File;

    const-string v5, "/data/logman.txt"

    invoke-direct {v2, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 47
    .local v2, logFile:Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v5

    const-wide/32 v7, 0x80000

    cmp-long v5, v5, v7

    if-lez v5, :cond_1

    .line 48
    new-instance v4, Ljava/io/File;

    const-string v5, "/data/logman_old.txt"

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 49
    .local v4, oldLogFile:Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 50
    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    .line 52
    :cond_0
    invoke-virtual {v2, v4}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 53
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 57
    .end local v4           #oldLogFile:Ljava/io/File;
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 58
    .local v3, logLineBuilder:Ljava/lang/StringBuilder;
    invoke-static {}, Landroid/util/LogMan;->getCurrentTimeString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    const-string/jumbo v5, "|"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    const-string/jumbo v5, "|"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    const-string v5, "\n"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    new-instance v1, Ljava/io/FileWriter;

    const/4 v5, 0x1

    invoke-direct {v1, v2, v5}, Ljava/io/FileWriter;-><init>(Ljava/io/File;Z)V

    .line 66
    .local v1, fw:Ljava/io/FileWriter;
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v7

    invoke-virtual {v1, v5, v6, v7}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;II)V

    .line 67
    invoke-virtual {v1}, Ljava/io/OutputStreamWriter;->flush()V

    .line 68
    invoke-virtual {v1}, Ljava/io/OutputStreamWriter;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 74
    .end local v1           #fw:Ljava/io/FileWriter;
    .end local v2           #logFile:Ljava/io/File;
    .end local v3           #logLineBuilder:Ljava/lang/StringBuilder;
    :goto_0
    return-void

    .line 70
    :catch_0
    move-exception v0

    .line 72
    .local v0, e:Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0
.end method

.method public static reboot(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 85
    const-string v0, "REBOOT"

    invoke-static {v0, p0}, Landroid/util/LogMan;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    return-void
.end method

.method public static shutdown(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 89
    const-string v0, "SHUTDOWN"

    invoke-static {v0, p0}, Landroid/util/LogMan;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    return-void
.end method
