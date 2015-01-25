.class public final Lcom/android/internal/telephony/gsm/SIMFileHandler;
.super Lcom/android/internal/telephony/IccFileHandler;
.source "SIMFileHandler.java"

# interfaces
.implements Lcom/android/internal/telephony/IccConstants;


# static fields
.field static final LOG_TAG:Ljava/lang/String; = "GSM"


# instance fields
.field private mApp:Lcom/android/internal/telephony/UiccCardApplication;


# direct methods
.method public constructor <init>(Lcom/android/internal/telephony/UiccCardApplication;Ljava/lang/String;Lcom/android/internal/telephony/CommandsInterface;)V
    .locals 1
    .parameter "app"
    .parameter "aid"
    .parameter "ci"

    .prologue
    .line 40
    invoke-direct {p0, p1, p2, p3}, Lcom/android/internal/telephony/IccFileHandler;-><init>(Lcom/android/internal/telephony/UiccCardApplication;Ljava/lang/String;Lcom/android/internal/telephony/CommandsInterface;)V

    .line 33
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/internal/telephony/gsm/SIMFileHandler;->mApp:Lcom/android/internal/telephony/UiccCardApplication;

    .line 41
    iput-object p1, p0, Lcom/android/internal/telephony/gsm/SIMFileHandler;->mApp:Lcom/android/internal/telephony/UiccCardApplication;

    .line 42
    return-void
.end method


# virtual methods
.method protected getEFPath(I)Ljava/lang/String;
    .locals 2
    .parameter "efid"

    .prologue
    .line 49
    sparse-switch p1, :sswitch_data_0

    .line 72
    iget-object v0, p0, Lcom/android/internal/telephony/gsm/SIMFileHandler;->mApp:Lcom/android/internal/telephony/UiccCardApplication;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/telephony/gsm/SIMFileHandler;->mApp:Lcom/android/internal/telephony/UiccCardApplication;

    invoke-virtual {v0}, Lcom/android/internal/telephony/UiccCardApplication;->getType()Lcom/android/internal/telephony/IccCardApplicationStatus$AppType;

    move-result-object v0

    sget-object v1, Lcom/android/internal/telephony/IccCardApplicationStatus$AppType;->APPTYPE_USIM:Lcom/android/internal/telephony/IccCardApplicationStatus$AppType;

    if-ne v0, v1, :cond_0

    .line 74
    sparse-switch p1, :sswitch_data_1

    .line 149
    :goto_0
    iget-object v0, p0, Lcom/android/internal/telephony/gsm/SIMFileHandler;->mApp:Lcom/android/internal/telephony/UiccCardApplication;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/internal/telephony/gsm/SIMFileHandler;->mApp:Lcom/android/internal/telephony/UiccCardApplication;

    invoke-virtual {v0}, Lcom/android/internal/telephony/UiccCardApplication;->getType()Lcom/android/internal/telephony/IccCardApplicationStatus$AppType;

    move-result-object v0

    sget-object v1, Lcom/android/internal/telephony/IccCardApplicationStatus$AppType;->APPTYPE_USIM:Lcom/android/internal/telephony/IccCardApplicationStatus$AppType;

    if-ne v0, v1, :cond_1

    .line 150
    const-string v0, "3F007F105F3A"

    .line 154
    :goto_1
    return-object v0

    .line 57
    :sswitch_0
    const-string v0, "3F007F20"

    goto :goto_1

    .line 60
    :sswitch_1
    const-string v0, "3F007F105F50"

    goto :goto_1

    .line 64
    :sswitch_2
    const-string v0, "3F00"

    goto :goto_1

    .line 68
    :sswitch_3
    const-string v0, "3F007F105F3A"

    goto :goto_1

    .line 105
    :sswitch_4
    const-string v0, "7FFF"

    goto :goto_1

    .line 110
    :cond_0
    sparse-switch p1, :sswitch_data_2

    goto :goto_0

    .line 135
    :sswitch_5
    const-string v0, "3F007F20"

    goto :goto_1

    .line 123
    :sswitch_6
    const-string v0, "3F007F10"

    goto :goto_1

    .line 138
    :sswitch_7
    const-string v0, "3F007F20"

    goto :goto_1

    .line 142
    :sswitch_8
    const-string v0, "3F007F10"

    goto :goto_1

    .line 152
    :cond_1
    const-string v0, "GSM"

    const-string v1, "Error: EF Path being returned in null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    const/4 v0, 0x0

    goto :goto_1

    .line 49
    nop

    :sswitch_data_0
    .sparse-switch
        0x2f05 -> :sswitch_2
        0x2fe2 -> :sswitch_2
        0x4f20 -> :sswitch_1
        0x4f30 -> :sswitch_3
        0x6f11 -> :sswitch_0
        0x6f13 -> :sswitch_0
        0x6f14 -> :sswitch_0
        0x6f15 -> :sswitch_0
        0x6f16 -> :sswitch_0
        0x6f17 -> :sswitch_0
        0x6f18 -> :sswitch_0
    .end sparse-switch

    .line 74
    :sswitch_data_1
    .sparse-switch
        0x6f06 -> :sswitch_4
        0x6f38 -> :sswitch_4
        0x6f3b -> :sswitch_4
        0x6f3c -> :sswitch_4
        0x6f40 -> :sswitch_4
        0x6f42 -> :sswitch_4
        0x6f43 -> :sswitch_4
        0x6f44 -> :sswitch_4
        0x6f46 -> :sswitch_4
        0x6f47 -> :sswitch_4
        0x6f49 -> :sswitch_4
        0x6f4b -> :sswitch_4
        0x6f4c -> :sswitch_4
        0x6f4d -> :sswitch_4
        0x6f4e -> :sswitch_4
        0x6f4f -> :sswitch_4
        0x6f53 -> :sswitch_4
        0x6f54 -> :sswitch_4
        0x6fad -> :sswitch_4
        0x6fb7 -> :sswitch_4
        0x6fc5 -> :sswitch_4
        0x6fc7 -> :sswitch_4
        0x6fc8 -> :sswitch_4
        0x6fc9 -> :sswitch_4
        0x6fca -> :sswitch_4
        0x6fcb -> :sswitch_4
        0x6fcd -> :sswitch_4
        0x6fe0 -> :sswitch_4
        0x6fe1 -> :sswitch_4
        0x6fe5 -> :sswitch_4
    .end sparse-switch

    .line 110
    :sswitch_data_2
    .sparse-switch
        0x6f38 -> :sswitch_5
        0x6f3a -> :sswitch_8
        0x6f3b -> :sswitch_6
        0x6f3c -> :sswitch_6
        0x6f40 -> :sswitch_6
        0x6f42 -> :sswitch_6
        0x6f43 -> :sswitch_6
        0x6f44 -> :sswitch_6
        0x6f46 -> :sswitch_5
        0x6f47 -> :sswitch_6
        0x6f49 -> :sswitch_6
        0x6f4a -> :sswitch_8
        0x6f4b -> :sswitch_6
        0x6f4c -> :sswitch_6
        0x6f4e -> :sswitch_6
        0x6f4f -> :sswitch_6
        0x6fad -> :sswitch_5
        0x6fb7 -> :sswitch_7
        0x6fc5 -> :sswitch_5
        0x6fc7 -> :sswitch_5
        0x6fc8 -> :sswitch_5
        0x6fc9 -> :sswitch_5
        0x6fca -> :sswitch_5
        0x6fcb -> :sswitch_5
        0x6fcd -> :sswitch_5
    .end sparse-switch
.end method

.method protected logd(Ljava/lang/String;)V
    .locals 3
    .parameter "msg"

    .prologue
    .line 159
    const-string v0, "GSM"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[SIMFileHandler] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 160
    return-void
.end method

.method protected loge(Ljava/lang/String;)V
    .locals 3
    .parameter "msg"

    .prologue
    .line 164
    const-string v0, "GSM"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[SIMFileHandler] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 165
    return-void
.end method
