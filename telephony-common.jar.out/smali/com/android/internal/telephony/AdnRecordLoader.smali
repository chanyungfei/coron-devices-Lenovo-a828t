.class public Lcom/android/internal/telephony/AdnRecordLoader;
.super Landroid/os/Handler;
.source "AdnRecordLoader.java"


# static fields
.field static final EVENT_ADN_LOAD_ALL_DONE:I = 0x3

.field static final EVENT_ADN_LOAD_DONE:I = 0x1

.field static final EVENT_EF_LINEAR_RECORD_SIZE_DONE:I = 0x4

.field static final EVENT_EF_LINEAR_RECORD_SIZE_DONE_ANR:I = 0x7

.field static final EVENT_EF_LINEAR_RECORD_SIZE_DONE_EMAIL:I = 0x6

.field static final EVENT_EF_LINEAR_RECORD_SIZE_DONE_GRP:I = 0x8

.field static final EVENT_EF_LINEAR_RECORD_SIZE_DONE_GSD:I = 0xa

.field static final EVENT_EF_LINEAR_RECORD_SIZE_DONE_SNE:I = 0x9

.field static final EVENT_EXT1_RECORD_LOAD_ALL_DONE:I = 0xb

.field static final EVENT_EXT2_RECORD_LOAD_ALL_DONE:I = 0xd

.field static final EVENT_EXT_RECORD_LOAD_DONE:I = 0x2

.field static final EVENT_UPDATE_ADN_RECORD_DONE:I = 0xf

.field static final EVENT_UPDATE_ANR_RECORD_DONE:I = 0x10

.field static final EVENT_UPDATE_EXT1_RECORD_DONE:I = 0xc

.field static final EVENT_UPDATE_EXT2_RECORD_DONE:I = 0xe

.field static final EVENT_UPDATE_RECORD_DONE:I = 0x5

.field static final LOG_TAG:Ljava/lang/String; = "RIL_AdnRecordLoader"

.field private static final MODE_ADN:I = 0x1

.field private static final MODE_ANR:I = 0x2

.field private static final MODE_FDN:I = 0x3

.field private static final VDBG:Z


# instance fields
.field private accessPort:I

.field adnIndex:I

.field adns:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/internal/telephony/AdnRecord;",
            ">;"
        }
    .end annotation
.end field

.field ef:I

.field extIndex:I

.field extbyte:[B

.field extensionEF:I

.field private mFh:Lcom/android/internal/telephony/IccFileHandler;

.field pendingExtLoads:I

.field pendingExtString:Ljava/lang/String;

.field pin2:Ljava/lang/String;

.field recordNumber:I

.field result:Ljava/lang/Object;

.field userResponse:Landroid/os/Message;


# direct methods
.method public constructor <init>(Lcom/android/internal/telephony/IccFileHandler;)V
    .locals 2
    .parameter "fh"

    .prologue
    const/4 v1, 0x0

    .line 84
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 45
    iput v1, p0, Lcom/android/internal/telephony/AdnRecordLoader;->extIndex:I

    .line 55
    iput v1, p0, Lcom/android/internal/telephony/AdnRecordLoader;->accessPort:I

    .line 85
    iput-object p1, p0, Lcom/android/internal/telephony/AdnRecordLoader;->mFh:Lcom/android/internal/telephony/IccFileHandler;

    .line 86
    return-void
.end method

.method private byteArrayEqualsEmpty([B)Z
    .locals 5
    .parameter "bytes"

    .prologue
    const/4 v4, -0x1

    const/4 v1, 0x0

    .line 1027
    array-length v2, p1

    const/16 v3, 0xd

    if-eq v2, v3, :cond_1

    .line 1039
    :cond_0
    :goto_0
    return v1

    .line 1030
    :cond_1
    aget-byte v2, p1, v1

    if-eqz v2, :cond_2

    aget-byte v2, p1, v1

    if-ne v2, v4, :cond_0

    .line 1034
    :cond_2
    const/4 v0, 0x1

    .local v0, i:I
    :goto_1
    array-length v2, p1

    if-ge v0, v2, :cond_3

    .line 1035
    aget-byte v2, p1, v0

    if-ne v2, v4, :cond_0

    .line 1034
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1039
    :cond_3
    const/4 v1, 0x1

    goto :goto_0
.end method

.method private findValidExtIndex(Lcom/android/internal/telephony/AdnRecord;ILandroid/os/AsyncResult;)V
    .locals 10
    .parameter "adn"
    .parameter "mode"
    .parameter "ar"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x2

    const/4 v8, 0x0

    const/4 v7, 0x3

    const/4 v6, 0x1

    .line 939
    const/4 v3, 0x0

    iput v3, p0, Lcom/android/internal/telephony/AdnRecordLoader;->extIndex:I

    .line 940
    iget v3, p0, Lcom/android/internal/telephony/AdnRecordLoader;->extensionEF:I

    const/16 v4, 0x6f4a

    if-ne v3, v4, :cond_0

    sget-object v3, Lcom/android/internal/telephony/AdnRecordCache;->mAdnExt1Map:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 941
    iput-object v8, p0, Lcom/android/internal/telephony/AdnRecordLoader;->result:Ljava/lang/Object;

    .line 942
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "findValidExtIndex failed, no ext1 EF"

    iget-object v5, p3, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 946
    :cond_0
    iget v3, p0, Lcom/android/internal/telephony/AdnRecordLoader;->extensionEF:I

    const/16 v4, 0x6f4b

    if-ne v3, v4, :cond_1

    sget-object v3, Lcom/android/internal/telephony/AdnRecordCache;->mAdnExt2Map:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 947
    iput-object v8, p0, Lcom/android/internal/telephony/AdnRecordLoader;->result:Ljava/lang/Object;

    .line 948
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "findValidExtIndex failed, no ext2 EF"

    iget-object v5, p3, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 952
    :cond_1
    if-eq p2, v6, :cond_2

    if-ne p2, v7, :cond_5

    .line 954
    :cond_2
    invoke-virtual {p1}, Lcom/android/internal/telephony/AdnRecord;->hasExtendedRecord()Z

    move-result v1

    .line 959
    .local v1, isExist:Z
    :goto_0
    if-eqz v1, :cond_7

    .line 960
    const-string v3, "RIL_AdnRecordLoader"

    const-string v4, "findValidExtIndex 1 "

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 961
    if-eq p2, v6, :cond_3

    if-ne p2, v7, :cond_6

    .line 962
    :cond_3
    iget v3, p1, Lcom/android/internal/telephony/AdnRecord;->extRecord:I

    iput v3, p0, Lcom/android/internal/telephony/AdnRecordLoader;->extIndex:I

    .line 1024
    :cond_4
    :goto_1
    return-void

    .line 957
    .end local v1           #isExist:Z
    :cond_5
    invoke-virtual {p1}, Lcom/android/internal/telephony/AdnRecord;->hasExtendedRecordAnr0()Z

    move-result v1

    .restart local v1       #isExist:Z
    goto :goto_0

    .line 964
    :cond_6
    iget v3, p1, Lcom/android/internal/telephony/AdnRecord;->extRecordAnr0:I

    iput v3, p0, Lcom/android/internal/telephony/AdnRecordLoader;->extIndex:I

    goto :goto_1

    .line 967
    :cond_7
    const-string v3, "RIL_AdnRecordLoader"

    const-string v4, "findValidExtIndex 2 "

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 968
    if-eq p2, v6, :cond_8

    if-ne p2, v9, :cond_e

    .line 969
    :cond_8
    sget-object v3, Lcom/android/internal/telephony/AdnRecordCache;->mAdnExt1Map:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 970
    .local v2, it:Ljava/util/Iterator;
    :cond_9
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_a

    .line 971
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 972
    .local v0, i:I
    sget-object v3, Lcom/android/internal/telephony/AdnRecordCache;->mAdnExt1Map:Ljava/util/Map;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9

    sget-object v3, Lcom/android/internal/telephony/AdnRecordCache;->mAdnExt1Map:Ljava/util/Map;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [B

    invoke-direct {p0, v3}, Lcom/android/internal/telephony/AdnRecordLoader;->byteArrayEqualsEmpty([B)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 975
    iput v0, p0, Lcom/android/internal/telephony/AdnRecordLoader;->extIndex:I

    .line 1012
    .end local v0           #i:I
    .end local v2           #it:Ljava/util/Iterator;
    :cond_a
    :goto_2
    const-string v3, "RIL_AdnRecordLoader"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "findValidExtIndex extIndex = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/android/internal/telephony/AdnRecordLoader;->extIndex:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1013
    iget v3, p0, Lcom/android/internal/telephony/AdnRecordLoader;->extIndex:I

    if-eqz v3, :cond_d

    if-eq p2, v6, :cond_b

    if-ne p2, v9, :cond_c

    :cond_b
    iget v3, p0, Lcom/android/internal/telephony/AdnRecordLoader;->extIndex:I

    sget-object v4, Lcom/android/internal/telephony/AdnRecordCache;->mAdnExt1Map:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->size()I

    move-result v4

    if-gt v3, v4, :cond_d

    :cond_c
    if-ne p2, v7, :cond_4

    iget v3, p0, Lcom/android/internal/telephony/AdnRecordLoader;->extIndex:I

    sget-object v4, Lcom/android/internal/telephony/AdnRecordCache;->mAdnExt2Map:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->size()I

    move-result v4

    if-le v3, v4, :cond_4

    .line 1016
    :cond_d
    iput-object v8, p0, Lcom/android/internal/telephony/AdnRecordLoader;->result:Ljava/lang/Object;

    .line 1019
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "update EF adn/fdn ext record failed, full ext"

    iget-object v5, p3, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 979
    :cond_e
    if-ne p2, v7, :cond_a

    .line 980
    sget-object v3, Lcom/android/internal/telephony/AdnRecordCache;->mAdnExt2Map:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 981
    .restart local v2       #it:Ljava/util/Iterator;
    :cond_f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_a

    .line 982
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 983
    .restart local v0       #i:I
    sget-object v3, Lcom/android/internal/telephony/AdnRecordCache;->mAdnExt2Map:Ljava/util/Map;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_f

    sget-object v3, Lcom/android/internal/telephony/AdnRecordCache;->mAdnExt2Map:Ljava/util/Map;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [B

    invoke-direct {p0, v3}, Lcom/android/internal/telephony/AdnRecordLoader;->byteArrayEqualsEmpty([B)Z

    move-result v3

    if-eqz v3, :cond_f

    .line 986
    iput v0, p0, Lcom/android/internal/telephony/AdnRecordLoader;->extIndex:I

    goto :goto_2
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 47
    .parameter "msg"

    .prologue
    .line 237
    :try_start_0
    move-object/from16 v0, p1

    iget v3, v0, Landroid/os/Message;->what:I
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    packed-switch v3, :pswitch_data_0

    .line 927
    :cond_0
    :goto_0
    :pswitch_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->userResponse:Landroid/os/Message;

    if-eqz v3, :cond_1

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->pendingExtLoads:I

    if-nez v3, :cond_1

    .line 928
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->userResponse:Landroid/os/Message;

    invoke-static {v3}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;)Landroid/os/AsyncResult;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/internal/telephony/AdnRecordLoader;->result:Ljava/lang/Object;

    iput-object v4, v3, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    .line 931
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->userResponse:Landroid/os/Message;

    invoke-virtual {v3}, Landroid/os/Message;->sendToTarget()V

    .line 932
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->userResponse:Landroid/os/Message;

    .line 933
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->extIndex:I

    .line 935
    :cond_1
    :goto_1
    return-void

    .line 239
    :pswitch_1
    :try_start_1
    move-object/from16 v0, p1

    iget-object v3, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Landroid/os/AsyncResult;

    move-object v0, v3

    check-cast v0, Landroid/os/AsyncResult;

    move-object/from16 v29, v0

    .line 240
    .local v29, ar:Landroid/os/AsyncResult;
    move-object/from16 v0, v29

    iget-object v3, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    check-cast v3, Lcom/android/internal/telephony/AdnRecord;

    move-object v0, v3

    check-cast v0, Lcom/android/internal/telephony/AdnRecord;

    move-object/from16 v19, v0

    .line 241
    .local v19, adn:Lcom/android/internal/telephony/AdnRecord;
    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/internal/telephony/AdnRecordLoader;->result:Ljava/lang/Object;

    .line 243
    move-object/from16 v0, v29

    iget-object v3, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v3, :cond_2

    .line 244
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "get EF record size failed"

    move-object/from16 v0, v29

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    .line 915
    .end local v19           #adn:Lcom/android/internal/telephony/AdnRecord;
    .end local v29           #ar:Landroid/os/AsyncResult;
    :catch_0
    move-exception v37

    .line 916
    .local v37, exc:Ljava/lang/RuntimeException;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->userResponse:Landroid/os/Message;

    if-eqz v3, :cond_1

    .line 917
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->userResponse:Landroid/os/Message;

    invoke-static {v3}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;)Landroid/os/AsyncResult;

    move-result-object v3

    move-object/from16 v0, v37

    iput-object v0, v3, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    .line 919
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->userResponse:Landroid/os/Message;

    invoke-virtual {v3}, Landroid/os/Message;->sendToTarget()V

    .line 922
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->userResponse:Landroid/os/Message;

    goto :goto_1

    .line 248
    .end local v37           #exc:Ljava/lang/RuntimeException;
    .restart local v19       #adn:Lcom/android/internal/telephony/AdnRecord;
    .restart local v29       #ar:Landroid/os/AsyncResult;
    :cond_2
    :try_start_2
    move-object/from16 v0, v29

    iget-object v3, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v3, [I

    move-object v0, v3

    check-cast v0, [I

    move-object/from16 v43, v0

    .line 254
    .local v43, recordSize:[I
    move-object/from16 v0, v43

    array-length v3, v0

    const/4 v4, 0x3

    if-ne v3, v4, :cond_3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->recordNumber:I

    const/4 v4, 0x2

    aget v4, v43, v4

    if-le v3, v4, :cond_4

    .line 255
    :cond_3
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "get wrong EF record size format"

    move-object/from16 v0, v29

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 258
    :cond_4
    const-string v46, ""

    .line 260
    .local v46, temp:Ljava/lang/String;
    move-object/from16 v0, v19

    iget-object v3, v0, Lcom/android/internal/telephony/AdnRecord;->number:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0x28

    if-le v3, v4, :cond_5

    .line 263
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "wrong ADN format, number length over 40"

    move-object/from16 v0, v29

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 265
    :cond_5
    move-object/from16 v0, v19

    iget-object v3, v0, Lcom/android/internal/telephony/AdnRecord;->number:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0x14

    if-le v3, v4, :cond_b

    .line 267
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->extensionEF:I

    const/16 v4, 0x6f4a

    if-ne v3, v4, :cond_6

    .line 268
    sget-object v3, Lcom/android/internal/telephony/AdnRecordCache;->mAdnExt1Map:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_7

    .line 269
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "ADN number is over length"

    move-object/from16 v0, v29

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 272
    :cond_6
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->extensionEF:I

    const/16 v4, 0x6f4b

    if-ne v3, v4, :cond_7

    .line 273
    sget-object v3, Lcom/android/internal/telephony/AdnRecordCache;->mAdnExt2Map:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_7

    .line 274
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "FDN number is over length"

    move-object/from16 v0, v29

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 279
    :cond_7
    const/4 v3, 0x2

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->pendingExtLoads:I

    .line 280
    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/android/internal/telephony/AdnRecord;->number:Ljava/lang/String;

    move-object/from16 v46, v0

    .line 281
    const-string v21, ""

    .line 282
    .local v21, temp2:Ljava/lang/String;
    const/4 v3, 0x0

    const/16 v4, 0x14

    move-object/from16 v0, v46

    invoke-virtual {v0, v3, v4}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v21

    .end local v21           #temp2:Ljava/lang/String;
    check-cast v21, Ljava/lang/String;

    .line 284
    .restart local v21       #temp2:Ljava/lang/String;
    move-object/from16 v0, v21

    move-object/from16 v1, v19

    iput-object v0, v1, Lcom/android/internal/telephony/AdnRecord;->number:Ljava/lang/String;

    .line 285
    const/16 v3, 0x14

    invoke-virtual/range {v46 .. v46}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    move-object/from16 v0, v46

    invoke-virtual {v0, v3, v4}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->pendingExtString:Ljava/lang/String;

    .line 289
    const-string v3, "RIL_AdnRecordLoader"

    const-string v4, " [adn] Split long String to shorts"

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 290
    const-string v3, "RIL_AdnRecordLoader"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, " EFadn String = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 291
    const-string v3, "RIL_AdnRecordLoader"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, " pendingExtString = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/internal/telephony/AdnRecordLoader;->pendingExtString:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 292
    move-object/from16 v0, v21

    move-object/from16 v1, v19

    iput-object v0, v1, Lcom/android/internal/telephony/AdnRecord;->number:Ljava/lang/String;

    .line 293
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->extensionEF:I

    const/16 v4, 0x6f4a

    if-ne v3, v4, :cond_9

    .line 295
    const/4 v3, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v29

    invoke-direct {v0, v1, v3, v2}, Lcom/android/internal/telephony/AdnRecordLoader;->findValidExtIndex(Lcom/android/internal/telephony/AdnRecord;ILandroid/os/AsyncResult;)V

    .line 300
    :cond_8
    :goto_2
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->extIndex:I

    and-int/lit16 v3, v3, 0xff

    move-object/from16 v0, v19

    iput v3, v0, Lcom/android/internal/telephony/AdnRecord;->extRecord:I

    .line 302
    const/4 v3, 0x0

    aget v3, v43, v3

    move-object/from16 v0, v19

    iget v4, v0, Lcom/android/internal/telephony/AdnRecord;->extRecord:I

    move-object/from16 v0, v19

    invoke-virtual {v0, v3, v4}, Lcom/android/internal/telephony/AdnRecord;->buildAdnString(II)[B

    move-result-object v6

    .line 304
    .local v6, data:[B
    move-object/from16 v0, v46

    move-object/from16 v1, v19

    iput-object v0, v1, Lcom/android/internal/telephony/AdnRecord;->number:Ljava/lang/String;

    .line 306
    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/internal/telephony/AdnRecordLoader;->result:Ljava/lang/Object;

    .line 307
    if-nez v6, :cond_a

    .line 308
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "wrong ADN format"

    move-object/from16 v0, v29

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 296
    .end local v6           #data:[B
    :cond_9
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->extensionEF:I

    const/16 v4, 0x6f4b

    if-ne v3, v4, :cond_8

    .line 298
    const/4 v3, 0x3

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v29

    invoke-direct {v0, v1, v3, v2}, Lcom/android/internal/telephony/AdnRecordLoader;->findValidExtIndex(Lcom/android/internal/telephony/AdnRecord;ILandroid/os/AsyncResult;)V

    goto :goto_2

    .line 312
    .restart local v6       #data:[B
    :cond_a
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->mFh:Lcom/android/internal/telephony/IccFileHandler;

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/internal/telephony/AdnRecordLoader;->ef:I

    move-object/from16 v0, p0

    iget v5, v0, Lcom/android/internal/telephony/AdnRecordLoader;->recordNumber:I

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/internal/telephony/AdnRecordLoader;->pin2:Ljava/lang/String;

    const/16 v8, 0xf

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v8

    invoke-virtual/range {v3 .. v8}, Lcom/android/internal/telephony/IccFileHandler;->updateEFLinearFixed(II[BLjava/lang/String;Landroid/os/Message;)V

    goto/16 :goto_0

    .line 317
    .end local v6           #data:[B
    .end local v21           #temp2:Ljava/lang/String;
    :cond_b
    invoke-virtual/range {v19 .. v19}, Lcom/android/internal/telephony/AdnRecord;->hasExtendedRecord()Z

    move-result v3

    if-eqz v3, :cond_12

    .line 318
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->extensionEF:I

    const/16 v4, 0x6f4a

    if-ne v3, v4, :cond_c

    sget-object v3, Lcom/android/internal/telephony/AdnRecordCache;->mAdnExt1Map:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_c

    .line 320
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "pervious ADN number format is wrong"

    move-object/from16 v0, v29

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 322
    :cond_c
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->extensionEF:I

    const/16 v4, 0x6f4b

    if-ne v3, v4, :cond_d

    sget-object v3, Lcom/android/internal/telephony/AdnRecordCache;->mAdnExt2Map:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_d

    .line 324
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "pervious FDN number format is wrong"

    move-object/from16 v0, v29

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 327
    :cond_d
    const-string v3, "RIL_AdnRecordLoader"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "<20 adn.extRecord1 = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v19

    iget v5, v0, Lcom/android/internal/telephony/AdnRecord;->extRecord:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 328
    const/16 v3, 0xd

    new-array v0, v3, [B

    move-object/from16 v42, v0

    .line 329
    .local v42, nullData:[B
    const/16 v41, 0x0

    .local v41, i:I
    :goto_3
    const/16 v3, 0xd

    move/from16 v0, v41

    if-ge v0, v3, :cond_e

    .line 330
    const/4 v3, -0x1

    aput-byte v3, v42, v41

    .line 329
    add-int/lit8 v41, v41, 0x1

    goto :goto_3

    .line 332
    :cond_e
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->extensionEF:I

    const/16 v4, 0x6f4a

    if-ne v3, v4, :cond_10

    .line 333
    sget-object v3, Lcom/android/internal/telephony/AdnRecordCache;->mAdnExt1Map:Ljava/util/Map;

    move-object/from16 v0, v19

    iget v4, v0, Lcom/android/internal/telephony/AdnRecord;->extRecord:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    move-object/from16 v0, v42

    invoke-interface {v3, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 337
    :cond_f
    :goto_4
    move-object/from16 v0, v19

    iget v3, v0, Lcom/android/internal/telephony/AdnRecord;->extRecord:I

    and-int/lit16 v3, v3, 0xff

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->extIndex:I

    .line 338
    const/16 v3, 0xff

    move-object/from16 v0, v19

    iput v3, v0, Lcom/android/internal/telephony/AdnRecord;->extRecord:I

    .line 339
    const/4 v3, 0x2

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->pendingExtLoads:I

    .line 340
    const-string v3, ""

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->pendingExtString:Ljava/lang/String;

    .line 341
    const/4 v3, 0x0

    aget v3, v43, v3

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Lcom/android/internal/telephony/AdnRecord;->buildAdnString(I)[B

    move-result-object v6

    .line 342
    .restart local v6       #data:[B
    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/internal/telephony/AdnRecordLoader;->result:Ljava/lang/Object;

    .line 343
    if-nez v6, :cond_11

    .line 344
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "wrong ADN format"

    move-object/from16 v0, v29

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 334
    .end local v6           #data:[B
    :cond_10
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->extensionEF:I

    const/16 v4, 0x6f4b

    if-ne v3, v4, :cond_f

    .line 335
    sget-object v3, Lcom/android/internal/telephony/AdnRecordCache;->mAdnExt2Map:Ljava/util/Map;

    move-object/from16 v0, v19

    iget v4, v0, Lcom/android/internal/telephony/AdnRecord;->extRecord:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    move-object/from16 v0, v42

    invoke-interface {v3, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4

    .line 347
    .restart local v6       #data:[B
    :cond_11
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->mFh:Lcom/android/internal/telephony/IccFileHandler;

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/internal/telephony/AdnRecordLoader;->ef:I

    move-object/from16 v0, p0

    iget v5, v0, Lcom/android/internal/telephony/AdnRecordLoader;->recordNumber:I

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/internal/telephony/AdnRecordLoader;->pin2:Ljava/lang/String;

    const/16 v8, 0xf

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v8

    invoke-virtual/range {v3 .. v8}, Lcom/android/internal/telephony/IccFileHandler;->updateEFLinearFixed(II[BLjava/lang/String;Landroid/os/Message;)V

    goto/16 :goto_0

    .line 351
    .end local v6           #data:[B
    .end local v41           #i:I
    .end local v42           #nullData:[B
    :cond_12
    const/4 v3, 0x0

    aget v3, v43, v3

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Lcom/android/internal/telephony/AdnRecord;->buildAdnString(I)[B

    move-result-object v6

    .line 352
    .restart local v6       #data:[B
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->pendingExtLoads:I

    .line 355
    if-nez v6, :cond_13

    .line 356
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "wrong ADN format"

    move-object/from16 v0, v29

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 360
    :cond_13
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->mFh:Lcom/android/internal/telephony/IccFileHandler;

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/internal/telephony/AdnRecordLoader;->ef:I

    move-object/from16 v0, p0

    iget v5, v0, Lcom/android/internal/telephony/AdnRecordLoader;->recordNumber:I

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/internal/telephony/AdnRecordLoader;->pin2:Ljava/lang/String;

    const/4 v8, 0x5

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v8

    invoke-virtual/range {v3 .. v8}, Lcom/android/internal/telephony/IccFileHandler;->updateEFLinearFixed(II[BLjava/lang/String;Landroid/os/Message;)V

    goto/16 :goto_0

    .line 365
    .end local v6           #data:[B
    .end local v19           #adn:Lcom/android/internal/telephony/AdnRecord;
    .end local v29           #ar:Landroid/os/AsyncResult;
    .end local v43           #recordSize:[I
    .end local v46           #temp:Ljava/lang/String;
    :pswitch_2
    move-object/from16 v0, p1

    iget-object v3, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Landroid/os/AsyncResult;

    move-object v0, v3

    check-cast v0, Landroid/os/AsyncResult;

    move-object/from16 v29, v0

    .line 366
    .restart local v29       #ar:Landroid/os/AsyncResult;
    move-object/from16 v0, v29

    iget-object v3, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v3, :cond_14

    .line 367
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "update EF adn record failed"

    move-object/from16 v0, v29

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 370
    :cond_14
    const-string v3, "RIL_AdnRecordLoader"

    const-string v4, "EVENT_UPDATE_ADN_RECORD_DONE 1 "

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 371
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->pendingExtLoads:I

    const/4 v4, 0x2

    if-ne v3, v4, :cond_17

    .line 372
    const-string v3, "RIL_AdnRecordLoader"

    const-string v4, "EVENT_UPDATE_ADN_RECORD_DONE 2 "

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0

    .line 374
    const/16 v3, 0xd

    :try_start_3
    new-array v3, v3, [B

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->extbyte:[B

    .line 375
    const/16 v41, 0x0

    .restart local v41       #i:I
    :goto_5
    const/16 v3, 0xd

    move/from16 v0, v41

    if-ge v0, v3, :cond_15

    .line 376
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->extbyte:[B

    const/4 v4, -0x1

    aput-byte v4, v3, v41

    .line 375
    add-int/lit8 v41, v41, 0x1

    goto :goto_5

    .line 379
    :cond_15
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->pendingExtString:Ljava/lang/String;

    invoke-static {v3}, Landroid/telephony/PhoneNumberUtils;->numberToCalledPartyBCD(Ljava/lang/String;)[B

    move-result-object v30

    .line 381
    .local v30, bcdNumber:[B
    if-eqz v30, :cond_16

    .line 382
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/internal/telephony/AdnRecordLoader;->extbyte:[B

    const/4 v5, 0x2

    move-object/from16 v0, v30

    array-length v7, v0

    move-object/from16 v0, v30

    invoke-static {v0, v3, v4, v5, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 384
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->extbyte:[B

    const/4 v4, 0x0

    const/4 v5, 0x2

    aput-byte v5, v3, v4

    .line 385
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->extbyte:[B

    const/4 v4, 0x1

    const/16 v5, 0xa

    aput-byte v5, v3, v4

    .line 387
    :cond_16
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/AdnRecordLoader;->result:Ljava/lang/Object;

    move-object/from16 v19, v0

    check-cast v19, Lcom/android/internal/telephony/AdnRecord;

    .line 388
    .restart local v19       #adn:Lcom/android/internal/telephony/AdnRecord;
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/internal/telephony/AdnRecordLoader;->mFh:Lcom/android/internal/telephony/IccFileHandler;

    move-object/from16 v0, p0

    iget v8, v0, Lcom/android/internal/telephony/AdnRecordLoader;->extensionEF:I

    move-object/from16 v0, p0

    iget v9, v0, Lcom/android/internal/telephony/AdnRecordLoader;->extIndex:I

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/android/internal/telephony/AdnRecordLoader;->extbyte:[B

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/internal/telephony/AdnRecordLoader;->pin2:Ljava/lang/String;

    const/4 v3, 0x5

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v12

    invoke-virtual/range {v7 .. v12}, Lcom/android/internal/telephony/IccFileHandler;->updateEFLinearFixed(II[BLjava/lang/String;Landroid/os/Message;)V

    .line 390
    const/16 v3, 0xf

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->accessPort:I

    .line 391
    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/internal/telephony/AdnRecordLoader;->result:Ljava/lang/Object;

    .line 392
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->pendingExtLoads:I

    .line 393
    const-string v3, ""

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->pendingExtString:Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_0

    goto/16 :goto_0

    .line 394
    .end local v19           #adn:Lcom/android/internal/telephony/AdnRecord;
    .end local v30           #bcdNumber:[B
    .end local v41           #i:I
    :catch_1
    move-exception v35

    .line 395
    .local v35, e:Ljava/lang/Exception;
    :try_start_4
    invoke-virtual/range {v35 .. v35}, Ljava/lang/Throwable;->printStackTrace()V

    .line 396
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "update EF adn ext1 record failed, full ext1"

    move-object/from16 v0, v29

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 401
    .end local v35           #e:Ljava/lang/Exception;
    :cond_17
    const/4 v3, 0x5

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v3, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v3

    invoke-virtual {v3}, Landroid/os/Message;->sendToTarget()V

    goto/16 :goto_0

    .line 405
    .end local v29           #ar:Landroid/os/AsyncResult;
    :pswitch_3
    const-string v3, "RIL_AdnRecordLoader"

    const-string v4, "EVENT_EF_LINEAR_RECORD_SIZE_DONE_EMAIL "

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 407
    move-object/from16 v0, p1

    iget-object v3, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Landroid/os/AsyncResult;

    move-object v0, v3

    check-cast v0, Landroid/os/AsyncResult;

    move-object/from16 v29, v0

    .line 408
    .restart local v29       #ar:Landroid/os/AsyncResult;
    move-object/from16 v0, v29

    iget-object v3, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    move-object v0, v3

    check-cast v0, Ljava/lang/String;

    move-object/from16 v36, v0

    .line 409
    .local v36, email:Ljava/lang/String;
    const-string v3, "RIL_AdnRecordLoader"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "email: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v36

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 411
    move-object/from16 v0, v29

    iget-object v3, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v3, :cond_18

    .line 412
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "get Email EF record size failed"

    move-object/from16 v0, v29

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 416
    :cond_18
    move-object/from16 v0, v29

    iget-object v3, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v3, [I

    move-object v0, v3

    check-cast v0, [I

    move-object/from16 v43, v0

    .line 417
    .restart local v43       #recordSize:[I
    const-string v3, "RIL_AdnRecordLoader"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, " recordSize[0] = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x0

    aget v5, v43, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 419
    move-object/from16 v0, v43

    array-length v3, v0

    const/4 v4, 0x3

    if-ne v3, v4, :cond_19

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->recordNumber:I

    const/4 v4, 0x2

    aget v4, v43, v4

    if-le v3, v4, :cond_1a

    .line 420
    :cond_19
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "get wrong EF record size format"

    move-object/from16 v0, v29

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_0

    .line 426
    :cond_1a
    const/4 v3, 0x0

    :try_start_5
    aget v3, v43, v3

    new-array v10, v3, [B

    .line 427
    .local v10, emailString:[B
    const/16 v41, 0x0

    .restart local v41       #i:I
    :goto_6
    const/4 v3, 0x0

    aget v3, v43, v3

    move/from16 v0, v41

    if-ge v0, v3, :cond_1b

    .line 428
    const/4 v3, -0x1

    aput-byte v3, v10, v41

    .line 427
    add-int/lit8 v41, v41, 0x1

    goto :goto_6

    .line 431
    :cond_1b
    invoke-static/range {v36 .. v36}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1c

    .line 432
    const-string v3, "RIL_AdnRecordLoader"

    const-string v4, "[buildEmailString] Empty email"

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 444
    :goto_7
    const-string v3, "RIL_AdnRecordLoader"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "---> email efid: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget v5, v0, Lcom/android/internal/telephony/AdnRecordLoader;->ef:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " recordNumber: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget v5, v0, Lcom/android/internal/telephony/AdnRecordLoader;->recordNumber:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 445
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/internal/telephony/AdnRecordLoader;->mFh:Lcom/android/internal/telephony/IccFileHandler;

    move-object/from16 v0, p0

    iget v8, v0, Lcom/android/internal/telephony/AdnRecordLoader;->ef:I

    move-object/from16 v0, p0

    iget v9, v0, Lcom/android/internal/telephony/AdnRecordLoader;->recordNumber:I

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/internal/telephony/AdnRecordLoader;->pin2:Ljava/lang/String;

    const/4 v3, 0x5

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v12

    invoke-virtual/range {v7 .. v12}, Lcom/android/internal/telephony/IccFileHandler;->updateEFLinearFixed(II[BLjava/lang/String;Landroid/os/Message;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2
    .catch Ljava/lang/RuntimeException; {:try_start_5 .. :try_end_5} :catch_0

    .line 453
    const/4 v3, 0x1

    :try_start_6
    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->pendingExtLoads:I
    :try_end_6
    .catch Ljava/lang/RuntimeException; {:try_start_6 .. :try_end_6} :catch_0

    goto/16 :goto_0

    .line 433
    :cond_1c
    :try_start_7
    invoke-virtual/range {v36 .. v36}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x0

    aget v4, v43, v4

    add-int/lit8 v4, v4, -0x2

    if-le v3, v4, :cond_1d

    .line 434
    const-string v3, "RIL_AdnRecordLoader"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "[buildEmailString] Max length of email is "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x0

    aget v5, v43, v5

    add-int/lit8 v5, v5, -0x2

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 435
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "wrong ADN Email format"

    move-object/from16 v0, v29

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2
    .catch Ljava/lang/RuntimeException; {:try_start_7 .. :try_end_7} :catch_0

    .line 447
    .end local v10           #emailString:[B
    .end local v41           #i:I
    :catch_2
    move-exception v35

    .line 448
    .restart local v35       #e:Ljava/lang/Exception;
    :try_start_8
    invoke-virtual/range {v35 .. v35}, Ljava/lang/Throwable;->printStackTrace()V

    .line 449
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "Update Email error"

    move-object/from16 v0, v29

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
    :try_end_8
    .catch Ljava/lang/RuntimeException; {:try_start_8 .. :try_end_8} :catch_0

    .line 438
    .end local v35           #e:Ljava/lang/Exception;
    .restart local v10       #emailString:[B
    .restart local v41       #i:I
    :cond_1d
    const/4 v3, 0x0

    :try_start_9
    aget v3, v43, v3

    add-int/lit8 v3, v3, -0x1

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/internal/telephony/AdnRecordLoader;->adnIndex:I

    int-to-byte v4, v4

    aput-byte v4, v10, v3

    .line 440
    invoke-static/range {v36 .. v36}, Lcom/android/internal/telephony/GsmAlphabet;->stringToGsm8BitPacked(Ljava/lang/String;)[B

    move-result-object v31

    .line 441
    .local v31, byteEmail:[B
    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object/from16 v0, v31

    array-length v5, v0

    move-object/from16 v0, v31

    invoke-static {v0, v3, v10, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_2
    .catch Ljava/lang/RuntimeException; {:try_start_9 .. :try_end_9} :catch_0

    goto/16 :goto_7

    .line 456
    .end local v10           #emailString:[B
    .end local v29           #ar:Landroid/os/AsyncResult;
    .end local v31           #byteEmail:[B
    .end local v36           #email:Ljava/lang/String;
    .end local v41           #i:I
    .end local v43           #recordSize:[I
    :pswitch_4
    :try_start_a
    const-string v3, "RIL_AdnRecordLoader"

    const-string v4, "EVENT_EF_LINEAR_RECORD_SIZE_DONE_GRP "

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 457
    move-object/from16 v0, p1

    iget-object v3, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Landroid/os/AsyncResult;

    move-object v0, v3

    check-cast v0, Landroid/os/AsyncResult;

    move-object/from16 v29, v0

    .line 458
    .restart local v29       #ar:Landroid/os/AsyncResult;
    move-object/from16 v0, v29

    iget-object v3, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    check-cast v3, [B

    move-object v0, v3

    check-cast v0, [B

    move-object/from16 v38, v0

    .line 459
    .local v38, grps:[B
    const-string v3, "RIL_AdnRecordLoader"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "grps: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v38

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 461
    move-object/from16 v0, v29

    iget-object v3, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v3, :cond_1e

    .line 462
    const-string v3, "RIL_AdnRecordLoader"

    const-string v4, " DONE_GRP, ar.exception != null"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 463
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "get Grp EF record size failed"

    move-object/from16 v0, v29

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 467
    :cond_1e
    move-object/from16 v0, v29

    iget-object v3, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v3, [I

    move-object v0, v3

    check-cast v0, [I

    move-object/from16 v43, v0

    .line 468
    .restart local v43       #recordSize:[I
    const-string v3, "RIL_AdnRecordLoader"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "recordSize[0] = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x0

    aget v5, v43, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 470
    move-object/from16 v0, v43

    array-length v3, v0

    const/4 v4, 0x3

    if-ne v3, v4, :cond_1f

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->recordNumber:I

    const/4 v4, 0x2

    aget v4, v43, v4

    if-le v3, v4, :cond_20

    .line 471
    :cond_1f
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "get wrong EF record size format"

    move-object/from16 v0, v29

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
    :try_end_a
    .catch Ljava/lang/RuntimeException; {:try_start_a .. :try_end_a} :catch_0

    .line 475
    :cond_20
    const/16 v3, 0xa

    :try_start_b
    new-array v14, v3, [B

    .line 477
    .local v14, bcdGrp:[B
    const/4 v3, 0x0

    aget v3, v43, v3

    new-array v0, v3, [B

    move-object/from16 v39, v0

    .line 478
    .local v39, grpsString:[B
    const/16 v41, 0x0

    .restart local v41       #i:I
    :goto_8
    const/4 v3, 0x0

    aget v3, v43, v3

    move/from16 v0, v41

    if-ge v0, v3, :cond_21

    .line 479
    const/4 v3, 0x0

    aput-byte v3, v39, v41

    .line 478
    add-int/lit8 v41, v41, 0x1

    goto :goto_8

    .line 481
    :cond_21
    const-string v3, "RIL_AdnRecordLoader"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "---> grps.length "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v38

    array-length v5, v0

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 482
    move-object/from16 v0, v38

    array-length v3, v0

    if-nez v3, :cond_22

    .line 483
    const-string v3, "RIL_AdnRecordLoader"

    const-string v4, "[buildgrpsString] Empty grps"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 491
    :goto_9
    const-string v3, "RIL_AdnRecordLoader"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "---> grp efid: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget v5, v0, Lcom/android/internal/telephony/AdnRecordLoader;->ef:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "recordNumber: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget v5, v0, Lcom/android/internal/telephony/AdnRecordLoader;->recordNumber:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 492
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/internal/telephony/AdnRecordLoader;->mFh:Lcom/android/internal/telephony/IccFileHandler;

    move-object/from16 v0, p0

    iget v12, v0, Lcom/android/internal/telephony/AdnRecordLoader;->ef:I

    move-object/from16 v0, p0

    iget v13, v0, Lcom/android/internal/telephony/AdnRecordLoader;->recordNumber:I

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/internal/telephony/AdnRecordLoader;->pin2:Ljava/lang/String;

    const/4 v3, 0x5

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v16

    invoke-virtual/range {v11 .. v16}, Lcom/android/internal/telephony/IccFileHandler;->updateEFLinearFixed(II[BLjava/lang/String;Landroid/os/Message;)V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_3
    .catch Ljava/lang/RuntimeException; {:try_start_b .. :try_end_b} :catch_0

    .line 500
    const/4 v3, 0x1

    :try_start_c
    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->pendingExtLoads:I
    :try_end_c
    .catch Ljava/lang/RuntimeException; {:try_start_c .. :try_end_c} :catch_0

    goto/16 :goto_0

    .line 484
    :cond_22
    :try_start_d
    move-object/from16 v0, v38

    array-length v3, v0

    const/16 v4, 0xa

    if-le v3, v4, :cond_23

    .line 485
    const-string v3, "RIL_AdnRecordLoader"

    const-string v4, "[buildgrpsString] Max length of anr is 10"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 486
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "wrong ADN Grp format"

    move-object/from16 v0, v29

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_3
    .catch Ljava/lang/RuntimeException; {:try_start_d .. :try_end_d} :catch_0

    .line 494
    .end local v14           #bcdGrp:[B
    .end local v39           #grpsString:[B
    .end local v41           #i:I
    :catch_3
    move-exception v35

    .line 495
    .restart local v35       #e:Ljava/lang/Exception;
    :try_start_e
    invoke-virtual/range {v35 .. v35}, Ljava/lang/Throwable;->printStackTrace()V

    .line 496
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "Update GRP error"

    move-object/from16 v0, v29

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 489
    .end local v35           #e:Ljava/lang/Exception;
    .restart local v14       #bcdGrp:[B
    .restart local v39       #grpsString:[B
    .restart local v41       #i:I
    :cond_23
    move-object/from16 v14, v38

    goto :goto_9

    .line 503
    .end local v14           #bcdGrp:[B
    .end local v29           #ar:Landroid/os/AsyncResult;
    .end local v38           #grps:[B
    .end local v39           #grpsString:[B
    .end local v41           #i:I
    .end local v43           #recordSize:[I
    :pswitch_5
    const-string v3, "RIL_AdnRecordLoader"

    const-string v4, "EVENT_EF_LINEAR_RECORD_SIZE_DONE_GSD "

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 504
    move-object/from16 v0, p1

    iget-object v3, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Landroid/os/AsyncResult;

    move-object v0, v3

    check-cast v0, Landroid/os/AsyncResult;

    move-object/from16 v29, v0

    .line 505
    .restart local v29       #ar:Landroid/os/AsyncResult;
    move-object/from16 v0, v29

    iget-object v3, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    move-object v0, v3

    check-cast v0, Ljava/lang/String;

    move-object/from16 v40, v0

    .line 506
    .local v40, gsdTag:Ljava/lang/String;
    const-string v3, "RIL_AdnRecordLoader"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "gsdTag: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v40

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 508
    move-object/from16 v0, v29

    iget-object v3, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v3, :cond_24

    .line 509
    const-string v3, "RIL_AdnRecordLoader"

    const-string v4, " DONE_GSD, ar.exception != null"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 510
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "get Gsd EF record size failed"

    move-object/from16 v0, v29

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 514
    :cond_24
    move-object/from16 v0, v29

    iget-object v3, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v3, [I

    move-object v0, v3

    check-cast v0, [I

    move-object/from16 v43, v0

    .line 515
    .restart local v43       #recordSize:[I
    const-string v3, "RIL_AdnRecordLoader"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "recordSize[0] = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x0

    aget v5, v43, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 517
    move-object/from16 v0, v43

    array-length v3, v0

    const/4 v4, 0x3

    if-ne v3, v4, :cond_25

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->recordNumber:I

    const/4 v4, 0x2

    aget v4, v43, v4

    if-le v3, v4, :cond_26

    .line 518
    :cond_25
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "get wrong EF record size format"

    move-object/from16 v0, v29

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
    :try_end_e
    .catch Ljava/lang/RuntimeException; {:try_start_e .. :try_end_e} :catch_0

    .line 524
    :cond_26
    const/4 v3, 0x0

    :try_start_f
    aget v3, v43, v3

    new-array v0, v3, [B

    move-object/from16 v18, v0

    .line 525
    .local v18, gsdString:[B
    const/16 v41, 0x0

    .restart local v41       #i:I
    :goto_a
    const/4 v3, 0x0

    aget v3, v43, v3

    move/from16 v0, v41

    if-ge v0, v3, :cond_27

    .line 526
    const/4 v3, -0x1

    aput-byte v3, v18, v41

    .line 525
    add-int/lit8 v41, v41, 0x1

    goto :goto_a

    .line 529
    :cond_27
    invoke-static/range {v40 .. v40}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_28

    .line 530
    const-string v3, "RIL_AdnRecordLoader"

    const-string v4, "[buildGsdString] Empty gsdTag"

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 541
    :goto_b
    const-string v3, "RIL_AdnRecordLoader"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "---> Gsd efid: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget v5, v0, Lcom/android/internal/telephony/AdnRecordLoader;->ef:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "recordNumber: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget v5, v0, Lcom/android/internal/telephony/AdnRecordLoader;->recordNumber:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 542
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/internal/telephony/AdnRecordLoader;->mFh:Lcom/android/internal/telephony/IccFileHandler;

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/internal/telephony/AdnRecordLoader;->ef:I

    move/from16 v16, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/internal/telephony/AdnRecordLoader;->recordNumber:I

    move/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/AdnRecordLoader;->pin2:Ljava/lang/String;

    move-object/from16 v19, v0

    const/4 v3, 0x5

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v20

    invoke-virtual/range {v15 .. v20}, Lcom/android/internal/telephony/IccFileHandler;->updateEFLinearFixed(II[BLjava/lang/String;Landroid/os/Message;)V
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_4
    .catch Ljava/lang/RuntimeException; {:try_start_f .. :try_end_f} :catch_0

    .line 550
    const/4 v3, 0x0

    :try_start_10
    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->pendingExtLoads:I
    :try_end_10
    .catch Ljava/lang/RuntimeException; {:try_start_10 .. :try_end_10} :catch_0

    goto/16 :goto_0

    .line 531
    :cond_28
    :try_start_11
    invoke-virtual/range {v40 .. v40}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x0

    aget v4, v43, v4

    if-le v3, v4, :cond_29

    .line 532
    const-string v3, "RIL_AdnRecordLoader"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "[buildGsdString] Max length of gsdTag is "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x0

    aget v5, v43, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 533
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "wrong ADN Gsd format"

    move-object/from16 v0, v29

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_4
    .catch Ljava/lang/RuntimeException; {:try_start_11 .. :try_end_11} :catch_0

    .line 544
    .end local v18           #gsdString:[B
    .end local v41           #i:I
    :catch_4
    move-exception v35

    .line 545
    .restart local v35       #e:Ljava/lang/Exception;
    :try_start_12
    invoke-virtual/range {v35 .. v35}, Ljava/lang/Throwable;->printStackTrace()V

    .line 546
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "Update GSD error"

    move-object/from16 v0, v29

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
    :try_end_12
    .catch Ljava/lang/RuntimeException; {:try_start_12 .. :try_end_12} :catch_0

    .line 537
    .end local v35           #e:Ljava/lang/Exception;
    .restart local v18       #gsdString:[B
    .restart local v41       #i:I
    :cond_29
    :try_start_13
    invoke-static/range {v40 .. v40}, Lcom/android/internal/telephony/GsmAlphabet;->stringToGsm8BitPacked(Ljava/lang/String;)[B

    move-result-object v32

    .line 538
    .local v32, byteGsd:[B
    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object/from16 v0, v32

    array-length v5, v0

    move-object/from16 v0, v32

    move-object/from16 v1, v18

    invoke-static {v0, v3, v1, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_13} :catch_4
    .catch Ljava/lang/RuntimeException; {:try_start_13 .. :try_end_13} :catch_0

    goto/16 :goto_b

    .line 553
    .end local v18           #gsdString:[B
    .end local v29           #ar:Landroid/os/AsyncResult;
    .end local v32           #byteGsd:[B
    .end local v40           #gsdTag:Ljava/lang/String;
    .end local v41           #i:I
    .end local v43           #recordSize:[I
    :pswitch_6
    :try_start_14
    const-string v3, "RIL_AdnRecordLoader"

    const-string v4, "EVENT_EF_LINEAR_RECORD_SIZE_DONE_ANR "

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 554
    move-object/from16 v0, p1

    iget-object v3, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Landroid/os/AsyncResult;

    move-object v0, v3

    check-cast v0, Landroid/os/AsyncResult;

    move-object/from16 v29, v0

    .line 555
    .restart local v29       #ar:Landroid/os/AsyncResult;
    move-object/from16 v0, v29

    iget-object v3, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    check-cast v3, Lcom/android/internal/telephony/AdnRecord;

    move-object v0, v3

    check-cast v0, Lcom/android/internal/telephony/AdnRecord;

    move-object/from16 v19, v0

    .line 556
    .restart local v19       #adn:Lcom/android/internal/telephony/AdnRecord;
    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/internal/telephony/AdnRecordLoader;->result:Ljava/lang/Object;

    .line 557
    move-object/from16 v0, v19

    iget-object v3, v0, Lcom/android/internal/telephony/AdnRecord;->anrs:[Ljava/lang/String;

    const/4 v4, 0x0

    aget-object v28, v3, v4

    .line 558
    .local v28, anr:Ljava/lang/String;
    const-string v3, "RIL_AdnRecordLoader"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "anr: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v28

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 560
    move-object/from16 v0, v29

    iget-object v3, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v3, :cond_2a

    .line 561
    const-string v3, "RIL_AdnRecordLoader"

    const-string v4, " DONE_ANR, ar.exception != null"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 562
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "get Anr EF record size failed"

    move-object/from16 v0, v29

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 566
    :cond_2a
    move-object/from16 v0, v29

    iget-object v3, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v3, [I

    move-object v0, v3

    check-cast v0, [I

    move-object/from16 v43, v0

    .line 567
    .restart local v43       #recordSize:[I
    const-string v3, "RIL_AdnRecordLoader"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "recordSize[0] = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x0

    aget v5, v43, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 569
    move-object/from16 v0, v43

    array-length v3, v0

    const/4 v4, 0x3

    if-ne v3, v4, :cond_2b

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->recordNumber:I

    const/4 v4, 0x2

    aget v4, v43, v4

    if-le v3, v4, :cond_2c

    .line 570
    :cond_2b
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "get wrong EF record size format"

    move-object/from16 v0, v29

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
    :try_end_14
    .catch Ljava/lang/RuntimeException; {:try_start_14 .. :try_end_14} :catch_0

    .line 575
    :cond_2c
    if-nez v28, :cond_2d

    .line 576
    :try_start_15
    const-string v3, "RIL_AdnRecordLoader"

    const-string v4, "[buildanrBytes] Null anr"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_15} :catch_5
    .catch Ljava/lang/RuntimeException; {:try_start_15 .. :try_end_15} :catch_0

    .line 659
    :goto_c
    const/4 v3, 0x1

    :try_start_16
    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->pendingExtLoads:I
    :try_end_16
    .catch Ljava/lang/RuntimeException; {:try_start_16 .. :try_end_16} :catch_0

    goto/16 :goto_0

    .line 577
    :cond_2d
    :try_start_17
    invoke-virtual/range {v28 .. v28}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0x28

    if-le v3, v4, :cond_2e

    .line 578
    const-string v3, "RIL_AdnRecordLoader"

    const-string v4, "[buildanrBytes] Max length of anr is 40"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 579
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "wrong ADN Anr format"

    move-object/from16 v0, v29

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_17} :catch_5
    .catch Ljava/lang/RuntimeException; {:try_start_17 .. :try_end_17} :catch_0

    .line 653
    :catch_5
    move-exception v35

    .line 654
    .restart local v35       #e:Ljava/lang/Exception;
    :try_start_18
    invoke-virtual/range {v35 .. v35}, Ljava/lang/Throwable;->printStackTrace()V

    .line 655
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "Update ANR error"

    move-object/from16 v0, v29

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
    :try_end_18
    .catch Ljava/lang/RuntimeException; {:try_start_18 .. :try_end_18} :catch_0

    .line 581
    .end local v35           #e:Ljava/lang/Exception;
    :cond_2e
    :try_start_19
    invoke-virtual/range {v28 .. v28}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0x14

    if-le v3, v4, :cond_31

    .line 584
    sget-object v3, Lcom/android/internal/telephony/AdnRecordCache;->mAdnExt1Map:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_2f

    .line 585
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "ANR number is over length"

    move-object/from16 v0, v29

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 588
    :cond_2f
    const/4 v3, 0x2

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->pendingExtLoads:I

    .line 589
    move-object/from16 v46, v28

    .line 590
    .restart local v46       #temp:Ljava/lang/String;
    const-string v21, ""

    .line 591
    .restart local v21       #temp2:Ljava/lang/String;
    const/4 v3, 0x0

    const/16 v4, 0x14

    move-object/from16 v0, v46

    invoke-virtual {v0, v3, v4}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v21

    .end local v21           #temp2:Ljava/lang/String;
    check-cast v21, Ljava/lang/String;

    .line 593
    .restart local v21       #temp2:Ljava/lang/String;
    move-object/from16 v28, v21

    .line 594
    const/16 v3, 0x14

    invoke-virtual/range {v46 .. v46}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    move-object/from16 v0, v46

    invoke-virtual {v0, v3, v4}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->pendingExtString:Ljava/lang/String;

    .line 598
    const-string v3, "RIL_AdnRecordLoader"

    const-string v4, " [anr] Split long String to shorts"

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 599
    const-string v3, "RIL_AdnRecordLoader"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, " EFanr String = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 600
    const-string v3, "RIL_AdnRecordLoader"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, " pendingExtString = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/internal/telephony/AdnRecordLoader;->pendingExtString:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 602
    const/4 v3, 0x2

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v29

    invoke-direct {v0, v1, v3, v2}, Lcom/android/internal/telephony/AdnRecordLoader;->findValidExtIndex(Lcom/android/internal/telephony/AdnRecord;ILandroid/os/AsyncResult;)V

    .line 603
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->extIndex:I

    and-int/lit16 v3, v3, 0xff

    move-object/from16 v0, v19

    iput v3, v0, Lcom/android/internal/telephony/AdnRecord;->extRecordAnr0:I

    .line 604
    const/4 v3, 0x0

    aget v20, v43, v3

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/internal/telephony/AdnRecordLoader;->recordNumber:I

    move/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/internal/telephony/AdnRecordLoader;->adnIndex:I

    move/from16 v23, v0

    move-object/from16 v0, v19

    iget v0, v0, Lcom/android/internal/telephony/AdnRecord;->extRecordAnr0:I

    move/from16 v24, v0

    invoke-virtual/range {v19 .. v24}, Lcom/android/internal/telephony/AdnRecord;->buildAnrString(ILjava/lang/String;III)[B

    move-result-object v6

    .line 606
    .restart local v6       #data:[B
    move-object/from16 v28, v46

    .line 608
    if-nez v6, :cond_30

    .line 609
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "wrong ADN anr format"

    move-object/from16 v0, v29

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 613
    :cond_30
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->mFh:Lcom/android/internal/telephony/IccFileHandler;

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/internal/telephony/AdnRecordLoader;->ef:I

    move-object/from16 v0, p0

    iget v5, v0, Lcom/android/internal/telephony/AdnRecordLoader;->recordNumber:I

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/internal/telephony/AdnRecordLoader;->pin2:Ljava/lang/String;

    const/16 v8, 0x10

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v8

    invoke-virtual/range {v3 .. v8}, Lcom/android/internal/telephony/IccFileHandler;->updateEFLinearFixed(II[BLjava/lang/String;Landroid/os/Message;)V

    goto/16 :goto_0

    .line 619
    .end local v6           #data:[B
    .end local v21           #temp2:Ljava/lang/String;
    .end local v46           #temp:Ljava/lang/String;
    :cond_31
    invoke-virtual/range {v19 .. v19}, Lcom/android/internal/telephony/AdnRecord;->hasExtendedRecordAnr0()Z

    move-result v3

    if-eqz v3, :cond_35

    .line 620
    const-string v3, "RIL_AdnRecordLoader"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "<20 adn.extRecordAnr0 = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v19

    iget v5, v0, Lcom/android/internal/telephony/AdnRecord;->extRecordAnr0:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 621
    sget-object v3, Lcom/android/internal/telephony/AdnRecordCache;->mAdnExt1Map:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_32

    .line 622
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "pervious ANR number format is wrong"

    move-object/from16 v0, v29

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 625
    :cond_32
    const/16 v3, 0xd

    new-array v0, v3, [B

    move-object/from16 v42, v0

    .line 626
    .restart local v42       #nullData:[B
    const/16 v41, 0x0

    .restart local v41       #i:I
    :goto_d
    const/16 v3, 0xd

    move/from16 v0, v41

    if-ge v0, v3, :cond_33

    .line 627
    const/4 v3, -0x1

    aput-byte v3, v42, v41

    .line 626
    add-int/lit8 v41, v41, 0x1

    goto :goto_d

    .line 629
    :cond_33
    sget-object v3, Lcom/android/internal/telephony/AdnRecordCache;->mAdnExt1Map:Ljava/util/Map;

    move-object/from16 v0, v19

    iget v4, v0, Lcom/android/internal/telephony/AdnRecord;->extRecordAnr0:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    move-object/from16 v0, v42

    invoke-interface {v3, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 630
    move-object/from16 v0, v19

    iget v3, v0, Lcom/android/internal/telephony/AdnRecord;->extRecordAnr0:I

    and-int/lit16 v3, v3, 0xff

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->extIndex:I

    .line 631
    const/16 v3, 0xff

    move-object/from16 v0, v19

    iput v3, v0, Lcom/android/internal/telephony/AdnRecord;->extRecordAnr0:I

    .line 632
    const/4 v3, 0x2

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->pendingExtLoads:I

    .line 633
    const-string v3, ""

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->pendingExtString:Ljava/lang/String;

    .line 634
    const/4 v3, 0x0

    aget v3, v43, v3

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/internal/telephony/AdnRecordLoader;->recordNumber:I

    move-object/from16 v0, p0

    iget v5, v0, Lcom/android/internal/telephony/AdnRecordLoader;->adnIndex:I

    move-object/from16 v0, v19

    move-object/from16 v1, v28

    invoke-virtual {v0, v3, v1, v4, v5}, Lcom/android/internal/telephony/AdnRecord;->buildAnrString(ILjava/lang/String;II)[B

    move-result-object v6

    .line 636
    .restart local v6       #data:[B
    if-nez v6, :cond_34

    .line 637
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "wrong ADN format"

    move-object/from16 v0, v29

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 640
    :cond_34
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->mFh:Lcom/android/internal/telephony/IccFileHandler;

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/internal/telephony/AdnRecordLoader;->ef:I

    move-object/from16 v0, p0

    iget v5, v0, Lcom/android/internal/telephony/AdnRecordLoader;->recordNumber:I

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/internal/telephony/AdnRecordLoader;->pin2:Ljava/lang/String;

    const/16 v8, 0x10

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v8

    invoke-virtual/range {v3 .. v8}, Lcom/android/internal/telephony/IccFileHandler;->updateEFLinearFixed(II[BLjava/lang/String;Landroid/os/Message;)V

    goto/16 :goto_0

    .line 644
    .end local v6           #data:[B
    .end local v41           #i:I
    .end local v42           #nullData:[B
    :cond_35
    const/4 v3, 0x0

    aget v3, v43, v3

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/internal/telephony/AdnRecordLoader;->recordNumber:I

    move-object/from16 v0, p0

    iget v5, v0, Lcom/android/internal/telephony/AdnRecordLoader;->adnIndex:I

    move-object/from16 v0, v19

    move-object/from16 v1, v28

    invoke-virtual {v0, v3, v1, v4, v5}, Lcom/android/internal/telephony/AdnRecord;->buildAnrString(ILjava/lang/String;II)[B

    move-result-object v6

    .line 645
    .restart local v6       #data:[B
    const-string v3, "RIL_AdnRecordLoader"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "---> anr efid: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget v5, v0, Lcom/android/internal/telephony/AdnRecordLoader;->ef:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "recordNumber: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget v5, v0, Lcom/android/internal/telephony/AdnRecordLoader;->recordNumber:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 646
    if-nez v6, :cond_36

    .line 647
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "wrong ADN format"

    move-object/from16 v0, v29

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 650
    :cond_36
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->mFh:Lcom/android/internal/telephony/IccFileHandler;

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/internal/telephony/AdnRecordLoader;->ef:I

    move-object/from16 v0, p0

    iget v5, v0, Lcom/android/internal/telephony/AdnRecordLoader;->recordNumber:I

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/internal/telephony/AdnRecordLoader;->pin2:Ljava/lang/String;

    const/4 v8, 0x5

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v8

    invoke-virtual/range {v3 .. v8}, Lcom/android/internal/telephony/IccFileHandler;->updateEFLinearFixed(II[BLjava/lang/String;Landroid/os/Message;)V
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_19} :catch_5
    .catch Ljava/lang/RuntimeException; {:try_start_19 .. :try_end_19} :catch_0

    goto/16 :goto_c

    .line 662
    .end local v6           #data:[B
    .end local v19           #adn:Lcom/android/internal/telephony/AdnRecord;
    .end local v28           #anr:Ljava/lang/String;
    .end local v29           #ar:Landroid/os/AsyncResult;
    .end local v43           #recordSize:[I
    :pswitch_7
    :try_start_1a
    move-object/from16 v0, p1

    iget-object v3, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Landroid/os/AsyncResult;

    move-object v0, v3

    check-cast v0, Landroid/os/AsyncResult;

    move-object/from16 v29, v0

    .line 663
    .restart local v29       #ar:Landroid/os/AsyncResult;
    move-object/from16 v0, v29

    iget-object v3, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v3, :cond_37

    .line 664
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "update EF adn record failed"

    move-object/from16 v0, v29

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 667
    :cond_37
    const-string v3, "RIL_AdnRecordLoader"

    const-string v4, "EVENT_UPDATE_ANR_RECORD_DONE 1 "

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 668
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->pendingExtLoads:I

    const/4 v4, 0x2

    if-ne v3, v4, :cond_3a

    .line 669
    const-string v3, "RIL_AdnRecordLoader"

    const-string v4, "EVENT_UPDATE_ANR_RECORD_DONE 2 "

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1a
    .catch Ljava/lang/RuntimeException; {:try_start_1a .. :try_end_1a} :catch_0

    .line 671
    const/16 v3, 0xd

    :try_start_1b
    new-array v3, v3, [B

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->extbyte:[B

    .line 672
    const/16 v41, 0x0

    .restart local v41       #i:I
    :goto_e
    const/16 v3, 0xd

    move/from16 v0, v41

    if-ge v0, v3, :cond_38

    .line 673
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->extbyte:[B

    const/4 v4, -0x1

    aput-byte v4, v3, v41

    .line 672
    add-int/lit8 v41, v41, 0x1

    goto :goto_e

    .line 675
    :cond_38
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->pendingExtString:Ljava/lang/String;

    invoke-static {v3}, Landroid/telephony/PhoneNumberUtils;->numberToCalledPartyBCD(Ljava/lang/String;)[B

    move-result-object v30

    .line 677
    .restart local v30       #bcdNumber:[B
    if-eqz v30, :cond_39

    .line 678
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/internal/telephony/AdnRecordLoader;->extbyte:[B

    const/4 v5, 0x2

    move-object/from16 v0, v30

    array-length v7, v0

    move-object/from16 v0, v30

    invoke-static {v0, v3, v4, v5, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 680
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->extbyte:[B

    const/4 v4, 0x0

    const/4 v5, 0x2

    aput-byte v5, v3, v4

    .line 681
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->extbyte:[B

    const/4 v4, 0x1

    const/16 v5, 0xa

    aput-byte v5, v3, v4

    .line 683
    :cond_39
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/AdnRecordLoader;->result:Ljava/lang/Object;

    move-object/from16 v19, v0

    check-cast v19, Lcom/android/internal/telephony/AdnRecord;

    .line 684
    .restart local v19       #adn:Lcom/android/internal/telephony/AdnRecord;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/AdnRecordLoader;->mFh:Lcom/android/internal/telephony/IccFileHandler;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/internal/telephony/AdnRecordLoader;->extensionEF:I

    move/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/internal/telephony/AdnRecordLoader;->extIndex:I

    move/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/AdnRecordLoader;->extbyte:[B

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/AdnRecordLoader;->pin2:Ljava/lang/String;

    move-object/from16 v26, v0

    const/4 v3, 0x5

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v27

    invoke-virtual/range {v22 .. v27}, Lcom/android/internal/telephony/IccFileHandler;->updateEFLinearFixed(II[BLjava/lang/String;Landroid/os/Message;)V

    .line 686
    const/16 v3, 0x10

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->accessPort:I

    .line 687
    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/internal/telephony/AdnRecordLoader;->result:Ljava/lang/Object;

    .line 688
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->pendingExtLoads:I

    .line 689
    const-string v3, ""

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->pendingExtString:Ljava/lang/String;
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_1b} :catch_6
    .catch Ljava/lang/RuntimeException; {:try_start_1b .. :try_end_1b} :catch_0

    goto/16 :goto_0

    .line 690
    .end local v19           #adn:Lcom/android/internal/telephony/AdnRecord;
    .end local v30           #bcdNumber:[B
    .end local v41           #i:I
    :catch_6
    move-exception v35

    .line 691
    .restart local v35       #e:Ljava/lang/Exception;
    :try_start_1c
    invoke-virtual/range {v35 .. v35}, Ljava/lang/Throwable;->printStackTrace()V

    .line 692
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "update EF adn ext1 record failed, full ext1"

    move-object/from16 v0, v29

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 697
    .end local v35           #e:Ljava/lang/Exception;
    :cond_3a
    const/4 v3, 0x5

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v3, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v3

    invoke-virtual {v3}, Landroid/os/Message;->sendToTarget()V

    goto/16 :goto_0

    .line 701
    .end local v29           #ar:Landroid/os/AsyncResult;
    :pswitch_8
    const-string v3, "RIL_AdnRecordLoader"

    const-string v4, "EVENT_EF_LINEAR_RECORD_SIZE_DONE_SNE "

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 703
    move-object/from16 v0, p1

    iget-object v3, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Landroid/os/AsyncResult;

    move-object v0, v3

    check-cast v0, Landroid/os/AsyncResult;

    move-object/from16 v29, v0

    .line 704
    .restart local v29       #ar:Landroid/os/AsyncResult;
    move-object/from16 v0, v29

    iget-object v3, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    move-object v0, v3

    check-cast v0, Ljava/lang/String;

    move-object/from16 v45, v0

    .line 705
    .local v45, sne:Ljava/lang/String;
    const-string v3, "RIL_AdnRecordLoader"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "sne: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v45

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 707
    move-object/from16 v0, v29

    iget-object v3, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v3, :cond_3b

    .line 708
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "get Sne EF record size failed"

    move-object/from16 v0, v29

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 712
    :cond_3b
    move-object/from16 v0, v29

    iget-object v3, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v3, [I

    move-object v0, v3

    check-cast v0, [I

    move-object/from16 v43, v0

    .line 713
    .restart local v43       #recordSize:[I
    const-string v3, "RIL_AdnRecordLoader"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, " recordSize[0] = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x0

    aget v5, v43, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 715
    move-object/from16 v0, v43

    array-length v3, v0

    const/4 v4, 0x3

    if-ne v3, v4, :cond_3c

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->recordNumber:I

    const/4 v4, 0x2

    aget v4, v43, v4

    if-le v3, v4, :cond_3d

    .line 716
    :cond_3c
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "get wrong EF record size format"

    move-object/from16 v0, v29

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
    :try_end_1c
    .catch Ljava/lang/RuntimeException; {:try_start_1c .. :try_end_1c} :catch_0

    .line 722
    :cond_3d
    const/4 v3, 0x0

    :try_start_1d
    aget v3, v43, v3

    new-array v0, v3, [B

    move-object/from16 v25, v0

    .line 723
    .local v25, sneString:[B
    const/16 v41, 0x0

    .restart local v41       #i:I
    :goto_f
    const/4 v3, 0x0

    aget v3, v43, v3

    move/from16 v0, v41

    if-ge v0, v3, :cond_3e

    .line 724
    const/4 v3, -0x1

    aput-byte v3, v25, v41

    .line 723
    add-int/lit8 v41, v41, 0x1

    goto :goto_f

    .line 727
    :cond_3e
    invoke-static/range {v45 .. v45}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_3f

    .line 728
    const-string v3, "RIL_AdnRecordLoader"

    const-string v4, "[buildSneString] Empty sne"

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 739
    :goto_10
    const-string v3, "RIL_AdnRecordLoader"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "---> sne efid: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget v5, v0, Lcom/android/internal/telephony/AdnRecordLoader;->ef:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "recordNumber: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget v5, v0, Lcom/android/internal/telephony/AdnRecordLoader;->recordNumber:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 740
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/AdnRecordLoader;->mFh:Lcom/android/internal/telephony/IccFileHandler;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/internal/telephony/AdnRecordLoader;->ef:I

    move/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/internal/telephony/AdnRecordLoader;->recordNumber:I

    move/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/AdnRecordLoader;->pin2:Ljava/lang/String;

    move-object/from16 v26, v0

    const/4 v3, 0x5

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v27

    invoke-virtual/range {v22 .. v27}, Lcom/android/internal/telephony/IccFileHandler;->updateEFLinearFixed(II[BLjava/lang/String;Landroid/os/Message;)V
    :try_end_1d
    .catch Ljava/lang/Exception; {:try_start_1d .. :try_end_1d} :catch_7
    .catch Ljava/lang/RuntimeException; {:try_start_1d .. :try_end_1d} :catch_0

    .line 748
    const/4 v3, 0x1

    :try_start_1e
    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->pendingExtLoads:I
    :try_end_1e
    .catch Ljava/lang/RuntimeException; {:try_start_1e .. :try_end_1e} :catch_0

    goto/16 :goto_0

    .line 729
    :cond_3f
    :try_start_1f
    invoke-virtual/range {v45 .. v45}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x0

    aget v4, v43, v4

    if-le v3, v4, :cond_40

    .line 730
    const-string v3, "RIL_AdnRecordLoader"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "[buildEmailString] Max length of sne is "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x0

    aget v5, v43, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 731
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "wrong ADN Sne format"

    move-object/from16 v0, v29

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_1f} :catch_7
    .catch Ljava/lang/RuntimeException; {:try_start_1f .. :try_end_1f} :catch_0

    .line 742
    .end local v25           #sneString:[B
    .end local v41           #i:I
    :catch_7
    move-exception v35

    .line 743
    .restart local v35       #e:Ljava/lang/Exception;
    :try_start_20
    invoke-virtual/range {v35 .. v35}, Ljava/lang/Throwable;->printStackTrace()V

    .line 744
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "Update SNE error"

    move-object/from16 v0, v29

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
    :try_end_20
    .catch Ljava/lang/RuntimeException; {:try_start_20 .. :try_end_20} :catch_0

    .line 735
    .end local v35           #e:Ljava/lang/Exception;
    .restart local v25       #sneString:[B
    .restart local v41       #i:I
    :cond_40
    :try_start_21
    invoke-static/range {v45 .. v45}, Lcom/android/internal/telephony/GsmAlphabet;->stringToGsm8BitPacked(Ljava/lang/String;)[B

    move-result-object v33

    .line 736
    .local v33, byteSne:[B
    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object/from16 v0, v33

    array-length v5, v0

    move-object/from16 v0, v33

    move-object/from16 v1, v25

    invoke-static {v0, v3, v1, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_21
    .catch Ljava/lang/Exception; {:try_start_21 .. :try_end_21} :catch_7
    .catch Ljava/lang/RuntimeException; {:try_start_21 .. :try_end_21} :catch_0

    goto/16 :goto_10

    .line 751
    .end local v25           #sneString:[B
    .end local v29           #ar:Landroid/os/AsyncResult;
    .end local v33           #byteSne:[B
    .end local v41           #i:I
    .end local v43           #recordSize:[I
    .end local v45           #sne:Ljava/lang/String;
    :pswitch_9
    :try_start_22
    move-object/from16 v0, p1

    iget-object v3, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Landroid/os/AsyncResult;

    move-object v0, v3

    check-cast v0, Landroid/os/AsyncResult;

    move-object/from16 v29, v0

    .line 752
    .restart local v29       #ar:Landroid/os/AsyncResult;
    move-object/from16 v0, v29

    iget-object v3, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v3, :cond_41

    .line 753
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "update EF adn record failed"

    move-object/from16 v0, v29

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 756
    :cond_41
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/AdnRecordLoader;->result:Ljava/lang/Object;

    move-object/from16 v19, v0

    check-cast v19, Lcom/android/internal/telephony/AdnRecord;

    .line 757
    .restart local v19       #adn:Lcom/android/internal/telephony/AdnRecord;
    if-eqz v19, :cond_42

    .line 758
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->accessPort:I

    const/16 v4, 0x10

    if-ne v3, v4, :cond_43

    .line 759
    sget-object v3, Lcom/android/internal/telephony/AdnRecordCache;->mAdnExt1Map:Ljava/util/Map;

    move-object/from16 v0, v19

    iget v4, v0, Lcom/android/internal/telephony/AdnRecord;->extRecordAnr0:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_42

    .line 760
    sget-object v3, Lcom/android/internal/telephony/AdnRecordCache;->mAdnExt1Map:Ljava/util/Map;

    move-object/from16 v0, v19

    iget v4, v0, Lcom/android/internal/telephony/AdnRecord;->extRecordAnr0:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/internal/telephony/AdnRecordLoader;->extbyte:[B

    invoke-interface {v3, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 774
    :cond_42
    :goto_11
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->pendingExtLoads:I

    .line 775
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->result:Ljava/lang/Object;

    if-nez v3, :cond_0

    .line 776
    move-object/from16 v0, v29

    iget-object v3, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->result:Ljava/lang/Object;

    goto/16 :goto_0

    .line 762
    :cond_43
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->accessPort:I

    const/16 v4, 0xf

    if-ne v3, v4, :cond_42

    .line 763
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->extensionEF:I

    const/16 v4, 0x6f4a

    if-ne v3, v4, :cond_44

    .line 764
    sget-object v3, Lcom/android/internal/telephony/AdnRecordCache;->mAdnExt1Map:Ljava/util/Map;

    move-object/from16 v0, v19

    iget v4, v0, Lcom/android/internal/telephony/AdnRecord;->extRecord:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_42

    .line 765
    sget-object v3, Lcom/android/internal/telephony/AdnRecordCache;->mAdnExt1Map:Ljava/util/Map;

    move-object/from16 v0, v19

    iget v4, v0, Lcom/android/internal/telephony/AdnRecord;->extRecord:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/internal/telephony/AdnRecordLoader;->extbyte:[B

    invoke-interface {v3, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_11

    .line 767
    :cond_44
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->extensionEF:I

    const/16 v4, 0x6f4b

    if-ne v3, v4, :cond_42

    .line 768
    sget-object v3, Lcom/android/internal/telephony/AdnRecordCache;->mAdnExt2Map:Ljava/util/Map;

    move-object/from16 v0, v19

    iget v4, v0, Lcom/android/internal/telephony/AdnRecord;->extRecord:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_42

    .line 769
    sget-object v3, Lcom/android/internal/telephony/AdnRecordCache;->mAdnExt2Map:Ljava/util/Map;

    move-object/from16 v0, v19

    iget v4, v0, Lcom/android/internal/telephony/AdnRecord;->extRecord:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/internal/telephony/AdnRecordLoader;->extbyte:[B

    invoke-interface {v3, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_11

    .line 780
    .end local v19           #adn:Lcom/android/internal/telephony/AdnRecord;
    .end local v29           #ar:Landroid/os/AsyncResult;
    :pswitch_a
    move-object/from16 v0, p1

    iget-object v3, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Landroid/os/AsyncResult;

    move-object v0, v3

    check-cast v0, Landroid/os/AsyncResult;

    move-object/from16 v29, v0

    .line 781
    .restart local v29       #ar:Landroid/os/AsyncResult;
    move-object/from16 v0, v29

    iget-object v3, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v3, [B

    move-object v0, v3

    check-cast v0, [B

    move-object v6, v0

    .line 783
    .restart local v6       #data:[B
    move-object/from16 v0, v29

    iget-object v3, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v3, :cond_45

    .line 784
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "load failed"

    move-object/from16 v0, v29

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 794
    :cond_45
    new-instance v19, Lcom/android/internal/telephony/AdnRecord;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->ef:I

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/internal/telephony/AdnRecordLoader;->recordNumber:I

    move-object/from16 v0, v19

    invoke-direct {v0, v3, v4, v6}, Lcom/android/internal/telephony/AdnRecord;-><init>(II[B)V

    .line 795
    .restart local v19       #adn:Lcom/android/internal/telephony/AdnRecord;
    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/internal/telephony/AdnRecordLoader;->result:Ljava/lang/Object;

    .line 797
    invoke-virtual/range {v19 .. v19}, Lcom/android/internal/telephony/AdnRecord;->hasExtendedRecord()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 802
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->pendingExtLoads:I

    .line 804
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->mFh:Lcom/android/internal/telephony/IccFileHandler;

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/internal/telephony/AdnRecordLoader;->extensionEF:I

    move-object/from16 v0, v19

    iget v5, v0, Lcom/android/internal/telephony/AdnRecord;->extRecord:I

    const/4 v7, 0x2

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v7, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v7

    invoke-virtual {v3, v4, v5, v7}, Lcom/android/internal/telephony/IccFileHandler;->loadEFLinearFixed(IILandroid/os/Message;)V

    goto/16 :goto_0

    .line 811
    .end local v6           #data:[B
    .end local v19           #adn:Lcom/android/internal/telephony/AdnRecord;
    .end local v29           #ar:Landroid/os/AsyncResult;
    :pswitch_b
    move-object/from16 v0, p1

    iget-object v3, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Landroid/os/AsyncResult;

    move-object v0, v3

    check-cast v0, Landroid/os/AsyncResult;

    move-object/from16 v29, v0

    .line 812
    .restart local v29       #ar:Landroid/os/AsyncResult;
    move-object/from16 v0, v29

    iget-object v3, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v3, [B

    move-object v0, v3

    check-cast v0, [B

    move-object v6, v0

    .line 813
    .restart local v6       #data:[B
    move-object/from16 v0, v29

    iget-object v3, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    check-cast v3, Lcom/android/internal/telephony/AdnRecord;

    move-object v0, v3

    check-cast v0, Lcom/android/internal/telephony/AdnRecord;

    move-object/from16 v19, v0

    .line 815
    .restart local v19       #adn:Lcom/android/internal/telephony/AdnRecord;
    move-object/from16 v0, v29

    iget-object v3, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v3, :cond_46

    .line 816
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "load failed"

    move-object/from16 v0, v29

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 819
    :cond_46
    const-string v3, "RIL_AdnRecordLoader"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "ADN extension EF: 0x"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget v5, v0, Lcom/android/internal/telephony/AdnRecordLoader;->extensionEF:I

    invoke-static {v5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v19

    iget v5, v0, Lcom/android/internal/telephony/AdnRecord;->extRecord:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v6}, Lcom/android/internal/telephony/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 824
    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Lcom/android/internal/telephony/AdnRecord;->appendExtRecord([B)V

    .line 826
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->pendingExtLoads:I

    add-int/lit8 v3, v3, -0x1

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->pendingExtLoads:I

    goto/16 :goto_0

    .line 831
    .end local v6           #data:[B
    .end local v19           #adn:Lcom/android/internal/telephony/AdnRecord;
    .end local v29           #ar:Landroid/os/AsyncResult;
    :pswitch_c
    move-object/from16 v0, p1

    iget-object v3, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Landroid/os/AsyncResult;

    move-object v0, v3

    check-cast v0, Landroid/os/AsyncResult;

    move-object/from16 v29, v0

    .line 832
    .restart local v29       #ar:Landroid/os/AsyncResult;
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->pendingExtLoads:I

    .line 833
    move-object/from16 v0, v29

    iget-object v3, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v3, Ljava/util/ArrayList;

    move-object v0, v3

    check-cast v0, Ljava/util/ArrayList;

    move-object/from16 v34, v0

    .line 834
    .local v34, datas:Ljava/util/ArrayList;,"Ljava/util/ArrayList<[B>;"
    move-object/from16 v0, v29

    iget-object v3, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v3, :cond_48

    .line 835
    const-string v3, "RIL_AdnRecordLoader"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "EVENT_EXT1_RECORD_LOAD_ALL_DONE ADN extension EF: 0x"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget v5, v0, Lcom/android/internal/telephony/AdnRecordLoader;->extensionEF:I

    invoke-static {v5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "has exception, no EFext1"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 838
    sget-object v3, Lcom/android/internal/telephony/AdnRecordCache;->mAdnExt1Map:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->clear()V

    .line 847
    :cond_47
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->mFh:Lcom/android/internal/telephony/IccFileHandler;

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/internal/telephony/AdnRecordLoader;->ef:I

    const/4 v5, 0x3

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/android/internal/telephony/IccFileHandler;->loadEFLinearFixedAll(ILandroid/os/Message;)V

    goto/16 :goto_0

    .line 840
    :cond_48
    const/16 v41, 0x0

    .restart local v41       #i:I
    invoke-virtual/range {v34 .. v34}, Ljava/util/ArrayList;->size()I

    move-result v44

    .local v44, s:I
    :goto_12
    move/from16 v0, v41

    move/from16 v1, v44

    if-ge v0, v1, :cond_47

    .line 841
    const-string v4, "RIL_AdnRecordLoader"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "EVENT_EXT1_RECORD_LOAD_ALL_DONE ADN extension EF: 0x"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget v5, v0, Lcom/android/internal/telephony/AdnRecordLoader;->extensionEF:I

    invoke-static {v5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "\n"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v34

    move/from16 v1, v41

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [B

    invoke-static {v3}, Lcom/android/internal/telephony/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 844
    sget-object v3, Lcom/android/internal/telephony/AdnRecordCache;->mAdnExt1Map:Ljava/util/Map;

    add-int/lit8 v4, v41, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    move-object/from16 v0, v34

    move/from16 v1, v41

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 840
    add-int/lit8 v41, v41, 0x1

    goto :goto_12

    .line 852
    .end local v29           #ar:Landroid/os/AsyncResult;
    .end local v34           #datas:Ljava/util/ArrayList;,"Ljava/util/ArrayList<[B>;"
    .end local v41           #i:I
    .end local v44           #s:I
    :pswitch_d
    move-object/from16 v0, p1

    iget-object v3, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Landroid/os/AsyncResult;

    move-object v0, v3

    check-cast v0, Landroid/os/AsyncResult;

    move-object/from16 v29, v0

    .line 853
    .restart local v29       #ar:Landroid/os/AsyncResult;
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->pendingExtLoads:I

    .line 854
    move-object/from16 v0, v29

    iget-object v3, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v3, Ljava/util/ArrayList;

    move-object v0, v3

    check-cast v0, Ljava/util/ArrayList;

    move-object/from16 v34, v0

    .line 855
    .restart local v34       #datas:Ljava/util/ArrayList;,"Ljava/util/ArrayList<[B>;"
    move-object/from16 v0, v29

    iget-object v3, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v3, :cond_4a

    .line 856
    const-string v3, "RIL_AdnRecordLoader"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "EVENT_EXT2_RECORD_LOAD_ALL_DONE ADN extension EF: 0x"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget v5, v0, Lcom/android/internal/telephony/AdnRecordLoader;->extensionEF:I

    invoke-static {v5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "has exception, no EFext2"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 859
    sget-object v3, Lcom/android/internal/telephony/AdnRecordCache;->mAdnExt2Map:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->clear()V

    .line 868
    :cond_49
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->mFh:Lcom/android/internal/telephony/IccFileHandler;

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/internal/telephony/AdnRecordLoader;->ef:I

    const/4 v5, 0x3

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/android/internal/telephony/IccFileHandler;->loadEFLinearFixedAll(ILandroid/os/Message;)V

    goto/16 :goto_0

    .line 861
    :cond_4a
    const/16 v41, 0x0

    .restart local v41       #i:I
    invoke-virtual/range {v34 .. v34}, Ljava/util/ArrayList;->size()I

    move-result v44

    .restart local v44       #s:I
    :goto_13
    move/from16 v0, v41

    move/from16 v1, v44

    if-ge v0, v1, :cond_49

    .line 862
    const-string v4, "RIL_AdnRecordLoader"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "EVENT_EXT2_RECORD_LOAD_ALL_DONE ADN extension EF: 0x"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget v5, v0, Lcom/android/internal/telephony/AdnRecordLoader;->extensionEF:I

    invoke-static {v5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "\n"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v34

    move/from16 v1, v41

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [B

    invoke-static {v3}, Lcom/android/internal/telephony/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 865
    sget-object v3, Lcom/android/internal/telephony/AdnRecordCache;->mAdnExt2Map:Ljava/util/Map;

    add-int/lit8 v4, v41, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    move-object/from16 v0, v34

    move/from16 v1, v41

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 861
    add-int/lit8 v41, v41, 0x1

    goto :goto_13

    .line 873
    .end local v29           #ar:Landroid/os/AsyncResult;
    .end local v34           #datas:Ljava/util/ArrayList;,"Ljava/util/ArrayList<[B>;"
    .end local v41           #i:I
    .end local v44           #s:I
    :pswitch_e
    move-object/from16 v0, p1

    iget-object v3, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Landroid/os/AsyncResult;

    move-object v0, v3

    check-cast v0, Landroid/os/AsyncResult;

    move-object/from16 v29, v0

    .line 874
    .restart local v29       #ar:Landroid/os/AsyncResult;
    move-object/from16 v0, v29

    iget-object v3, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v3, Ljava/util/ArrayList;

    move-object v0, v3

    check-cast v0, Ljava/util/ArrayList;

    move-object/from16 v34, v0

    .line 875
    .restart local v34       #datas:Ljava/util/ArrayList;,"Ljava/util/ArrayList<[B>;"
    move-object/from16 v0, v29

    iget-object v3, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v3, :cond_4b

    .line 876
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "load failed"

    move-object/from16 v0, v29

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {v3, v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 879
    :cond_4b
    new-instance v3, Ljava/util/ArrayList;

    invoke-virtual/range {v34 .. v34}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->adns:Ljava/util/ArrayList;

    .line 880
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->adns:Ljava/util/ArrayList;

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->result:Ljava/lang/Object;

    .line 881
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->pendingExtLoads:I

    .line 883
    const/16 v41, 0x0

    .restart local v41       #i:I
    invoke-virtual/range {v34 .. v34}, Ljava/util/ArrayList;->size()I

    move-result v44

    .restart local v44       #s:I
    :goto_14
    move/from16 v0, v41

    move/from16 v1, v44

    if-ge v0, v1, :cond_0

    .line 884
    new-instance v19, Lcom/android/internal/telephony/AdnRecord;

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/internal/telephony/AdnRecordLoader;->ef:I

    add-int/lit8 v5, v41, 0x1

    move-object/from16 v0, v34

    move/from16 v1, v41

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [B

    move-object/from16 v0, v19

    invoke-direct {v0, v4, v5, v3}, Lcom/android/internal/telephony/AdnRecord;-><init>(II[B)V

    .line 885
    .restart local v19       #adn:Lcom/android/internal/telephony/AdnRecord;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->adns:Ljava/util/ArrayList;

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 887
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->extensionEF:I

    const/16 v4, 0x6f4a

    if-ne v3, v4, :cond_4d

    invoke-virtual/range {v19 .. v19}, Lcom/android/internal/telephony/AdnRecord;->hasExtendedRecord()Z

    move-result v3

    if-eqz v3, :cond_4d

    sget-object v3, Lcom/android/internal/telephony/AdnRecordCache;->mAdnExt1Map:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_4d

    .line 894
    sget-object v3, Lcom/android/internal/telephony/AdnRecordCache;->mAdnExt1Map:Ljava/util/Map;

    move-object/from16 v0, v19

    iget v4, v0, Lcom/android/internal/telephony/AdnRecord;->extRecord:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [B

    .line 895
    .restart local v6       #data:[B
    const-string v3, "RIL_AdnRecordLoader"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "ADN extension EF: 0x"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget v5, v0, Lcom/android/internal/telephony/AdnRecordLoader;->extensionEF:I

    invoke-static {v5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v19

    iget v5, v0, Lcom/android/internal/telephony/AdnRecord;->extRecord:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v6}, Lcom/android/internal/telephony/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 900
    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Lcom/android/internal/telephony/AdnRecord;->appendExtRecord([B)V

    .line 883
    .end local v6           #data:[B
    :cond_4c
    :goto_15
    add-int/lit8 v41, v41, 0x1

    goto/16 :goto_14

    .line 901
    :cond_4d
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/internal/telephony/AdnRecordLoader;->extensionEF:I

    const/16 v4, 0x6f4b

    if-ne v3, v4, :cond_4c

    invoke-virtual/range {v19 .. v19}, Lcom/android/internal/telephony/AdnRecord;->hasExtendedRecord()Z

    move-result v3

    if-eqz v3, :cond_4c

    sget-object v3, Lcom/android/internal/telephony/AdnRecordCache;->mAdnExt2Map:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_4c

    .line 904
    sget-object v3, Lcom/android/internal/telephony/AdnRecordCache;->mAdnExt2Map:Ljava/util/Map;

    move-object/from16 v0, v19

    iget v4, v0, Lcom/android/internal/telephony/AdnRecord;->extRecord:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [B

    .line 905
    .restart local v6       #data:[B
    const-string v3, "RIL_AdnRecordLoader"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "FDN extension EF: 0x"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget v5, v0, Lcom/android/internal/telephony/AdnRecordLoader;->extensionEF:I

    invoke-static {v5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v19

    iget v5, v0, Lcom/android/internal/telephony/AdnRecord;->extRecord:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v6}, Lcom/android/internal/telephony/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 910
    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Lcom/android/internal/telephony/AdnRecord;->appendExtRecord([B)V
    :try_end_22
    .catch Ljava/lang/RuntimeException; {:try_start_22 .. :try_end_22} :catch_0

    goto :goto_15

    .line 237
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_a
        :pswitch_b
        :pswitch_e
        :pswitch_1
        :pswitch_9
        :pswitch_3
        :pswitch_6
        :pswitch_4
        :pswitch_8
        :pswitch_5
        :pswitch_c
        :pswitch_0
        :pswitch_d
        :pswitch_0
        :pswitch_2
        :pswitch_7
    .end packed-switch
.end method

.method public loadAllFromEF(IILandroid/os/Message;)V
    .locals 4
    .parameter "ef"
    .parameter "extensionEF"
    .parameter "response"

    .prologue
    const/4 v3, 0x3

    .line 114
    iput p1, p0, Lcom/android/internal/telephony/AdnRecordLoader;->ef:I

    .line 115
    iput p2, p0, Lcom/android/internal/telephony/AdnRecordLoader;->extensionEF:I

    .line 116
    iput-object p3, p0, Lcom/android/internal/telephony/AdnRecordLoader;->userResponse:Landroid/os/Message;

    .line 118
    if-lez p2, :cond_2

    .line 120
    const/16 v0, 0x6f4a

    if-ne p2, v0, :cond_0

    .line 121
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecordLoader;->mFh:Lcom/android/internal/telephony/IccFileHandler;

    const/16 v1, 0xb

    invoke-virtual {p0, v1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, p2, v1}, Lcom/android/internal/telephony/IccFileHandler;->loadEFLinearFixedAll(ILandroid/os/Message;)V

    .line 139
    :goto_0
    return-void

    .line 123
    :cond_0
    const/16 v0, 0x6f4b

    if-ne p2, v0, :cond_1

    .line 124
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecordLoader;->mFh:Lcom/android/internal/telephony/IccFileHandler;

    const/16 v1, 0xd

    invoke-virtual {p0, v1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, p2, v1}, Lcom/android/internal/telephony/IccFileHandler;->loadEFLinearFixedAll(ILandroid/os/Message;)V

    goto :goto_0

    .line 127
    :cond_1
    const-string v0, "RIL_AdnRecordLoader"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "don\'t support this extensionEF: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", load EF: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " directy"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecordLoader;->mFh:Lcom/android/internal/telephony/IccFileHandler;

    invoke-virtual {p0, v3}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/android/internal/telephony/IccFileHandler;->loadEFLinearFixedAll(ILandroid/os/Message;)V

    goto :goto_0

    .line 134
    :cond_2
    const-string v0, "RIL_AdnRecordLoader"

    const-string v1, "no extensionEF"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 135
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecordLoader;->mFh:Lcom/android/internal/telephony/IccFileHandler;

    invoke-virtual {p0, v3}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/android/internal/telephony/IccFileHandler;->loadEFLinearFixedAll(ILandroid/os/Message;)V

    goto :goto_0
.end method

.method public loadFromEF(IIILandroid/os/Message;)V
    .locals 2
    .parameter "ef"
    .parameter "extensionEF"
    .parameter "recordNumber"
    .parameter "response"

    .prologue
    .line 95
    iput p1, p0, Lcom/android/internal/telephony/AdnRecordLoader;->ef:I

    .line 96
    iput p2, p0, Lcom/android/internal/telephony/AdnRecordLoader;->extensionEF:I

    .line 97
    iput p3, p0, Lcom/android/internal/telephony/AdnRecordLoader;->recordNumber:I

    .line 98
    iput-object p4, p0, Lcom/android/internal/telephony/AdnRecordLoader;->userResponse:Landroid/os/Message;

    .line 100
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecordLoader;->mFh:Lcom/android/internal/telephony/IccFileHandler;

    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, p1, p3, v1}, Lcom/android/internal/telephony/IccFileHandler;->loadEFLinearFixed(IILandroid/os/Message;)V

    .line 104
    return-void
.end method

.method public updateAnrEF(Lcom/android/internal/telephony/AdnRecord;IIIILjava/lang/String;Landroid/os/Message;)V
    .locals 3
    .parameter "adn"
    .parameter "anrEF"
    .parameter "extensionEF"
    .parameter "recordAnrIndex"
    .parameter "adnIndex"
    .parameter "pin2"
    .parameter "response"

    .prologue
    .line 181
    iput p2, p0, Lcom/android/internal/telephony/AdnRecordLoader;->ef:I

    .line 182
    iput p3, p0, Lcom/android/internal/telephony/AdnRecordLoader;->extensionEF:I

    .line 183
    iput p4, p0, Lcom/android/internal/telephony/AdnRecordLoader;->recordNumber:I

    .line 184
    iput-object p7, p0, Lcom/android/internal/telephony/AdnRecordLoader;->userResponse:Landroid/os/Message;

    .line 185
    iput p5, p0, Lcom/android/internal/telephony/AdnRecordLoader;->adnIndex:I

    .line 186
    iput-object p6, p0, Lcom/android/internal/telephony/AdnRecordLoader;->pin2:Ljava/lang/String;

    .line 188
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecordLoader;->mFh:Lcom/android/internal/telephony/IccFileHandler;

    iget v1, p0, Lcom/android/internal/telephony/AdnRecordLoader;->ef:I

    const/4 v2, 0x7

    invoke-virtual {p0, v2, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/android/internal/telephony/IccFileHandler;->getEFLinearRecordSize(ILandroid/os/Message;)V

    .line 190
    return-void
.end method

.method public updateEF(Lcom/android/internal/telephony/AdnRecord;IIILjava/lang/String;Landroid/os/Message;)V
    .locals 2
    .parameter "adn"
    .parameter "ef"
    .parameter "extensionEF"
    .parameter "recordNumber"
    .parameter "pin2"
    .parameter "response"

    .prologue
    .line 156
    iput p2, p0, Lcom/android/internal/telephony/AdnRecordLoader;->ef:I

    .line 157
    iput p3, p0, Lcom/android/internal/telephony/AdnRecordLoader;->extensionEF:I

    .line 158
    iput p4, p0, Lcom/android/internal/telephony/AdnRecordLoader;->recordNumber:I

    .line 159
    iput-object p6, p0, Lcom/android/internal/telephony/AdnRecordLoader;->userResponse:Landroid/os/Message;

    .line 160
    iput-object p5, p0, Lcom/android/internal/telephony/AdnRecordLoader;->pin2:Ljava/lang/String;

    .line 162
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecordLoader;->mFh:Lcom/android/internal/telephony/IccFileHandler;

    const/4 v1, 0x4

    invoke-virtual {p0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, p2, v1}, Lcom/android/internal/telephony/IccFileHandler;->getEFLinearRecordSize(ILandroid/os/Message;)V

    .line 164
    return-void
.end method

.method public updateEmailEF(Lcom/android/internal/telephony/AdnRecord;IIILjava/lang/String;Landroid/os/Message;)V
    .locals 5
    .parameter "adn"
    .parameter "emailEF"
    .parameter "recordEmailIndex"
    .parameter "adnIndex"
    .parameter "pin2"
    .parameter "response"

    .prologue
    .line 169
    iput p2, p0, Lcom/android/internal/telephony/AdnRecordLoader;->ef:I

    .line 170
    iput p3, p0, Lcom/android/internal/telephony/AdnRecordLoader;->recordNumber:I

    .line 171
    iput-object p6, p0, Lcom/android/internal/telephony/AdnRecordLoader;->userResponse:Landroid/os/Message;

    .line 172
    iput p4, p0, Lcom/android/internal/telephony/AdnRecordLoader;->adnIndex:I

    .line 173
    iput-object p5, p0, Lcom/android/internal/telephony/AdnRecordLoader;->pin2:Ljava/lang/String;

    .line 175
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecordLoader;->mFh:Lcom/android/internal/telephony/IccFileHandler;

    iget v1, p0, Lcom/android/internal/telephony/AdnRecordLoader;->ef:I

    const/4 v2, 0x6

    iget-object v3, p1, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    const/4 v4, 0x0

    aget-object v3, v3, v4

    invoke-virtual {p0, v2, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/android/internal/telephony/IccFileHandler;->getEFLinearRecordSize(ILandroid/os/Message;)V

    .line 177
    return-void
.end method

.method public updateGrpEF(Lcom/android/internal/telephony/AdnRecord;IILjava/lang/String;Landroid/os/Message;)V
    .locals 4
    .parameter "adn"
    .parameter "grpEF"
    .parameter "grpIndex"
    .parameter "pin2"
    .parameter "response"

    .prologue
    .line 206
    iput p2, p0, Lcom/android/internal/telephony/AdnRecordLoader;->ef:I

    .line 207
    iput p3, p0, Lcom/android/internal/telephony/AdnRecordLoader;->recordNumber:I

    .line 208
    iput-object p5, p0, Lcom/android/internal/telephony/AdnRecordLoader;->userResponse:Landroid/os/Message;

    .line 209
    iput p3, p0, Lcom/android/internal/telephony/AdnRecordLoader;->adnIndex:I

    .line 210
    iput-object p4, p0, Lcom/android/internal/telephony/AdnRecordLoader;->pin2:Ljava/lang/String;

    .line 212
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecordLoader;->mFh:Lcom/android/internal/telephony/IccFileHandler;

    iget v1, p0, Lcom/android/internal/telephony/AdnRecordLoader;->ef:I

    const/16 v2, 0x8

    iget-object v3, p1, Lcom/android/internal/telephony/AdnRecord;->grps:[B

    invoke-virtual {p0, v2, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/android/internal/telephony/IccFileHandler;->getEFLinearRecordSize(ILandroid/os/Message;)V

    .line 214
    return-void
.end method

.method public updateGsdEF(IILjava/lang/String;Ljava/lang/String;Landroid/os/Message;)V
    .locals 3
    .parameter "gspEf"
    .parameter "grpId"
    .parameter "grpTag"
    .parameter "pin2"
    .parameter "response"

    .prologue
    .line 217
    iput p1, p0, Lcom/android/internal/telephony/AdnRecordLoader;->ef:I

    .line 218
    iput p2, p0, Lcom/android/internal/telephony/AdnRecordLoader;->recordNumber:I

    .line 219
    iput-object p5, p0, Lcom/android/internal/telephony/AdnRecordLoader;->userResponse:Landroid/os/Message;

    .line 220
    iput-object p4, p0, Lcom/android/internal/telephony/AdnRecordLoader;->pin2:Ljava/lang/String;

    .line 222
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecordLoader;->mFh:Lcom/android/internal/telephony/IccFileHandler;

    iget v1, p0, Lcom/android/internal/telephony/AdnRecordLoader;->ef:I

    const/16 v2, 0xa

    invoke-virtual {p0, v2, p3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/android/internal/telephony/IccFileHandler;->getEFLinearRecordSize(ILandroid/os/Message;)V

    .line 224
    return-void
.end method

.method public updateSneEF(Lcom/android/internal/telephony/AdnRecord;IIILjava/lang/String;Landroid/os/Message;)V
    .locals 5
    .parameter "adn"
    .parameter "sneEF"
    .parameter "recordSneIndex"
    .parameter "adnIndex"
    .parameter "pin2"
    .parameter "response"

    .prologue
    .line 194
    iput p2, p0, Lcom/android/internal/telephony/AdnRecordLoader;->ef:I

    .line 195
    iput p3, p0, Lcom/android/internal/telephony/AdnRecordLoader;->recordNumber:I

    .line 196
    iput-object p6, p0, Lcom/android/internal/telephony/AdnRecordLoader;->userResponse:Landroid/os/Message;

    .line 197
    iput p4, p0, Lcom/android/internal/telephony/AdnRecordLoader;->adnIndex:I

    .line 198
    iput-object p5, p0, Lcom/android/internal/telephony/AdnRecordLoader;->pin2:Ljava/lang/String;

    .line 200
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecordLoader;->mFh:Lcom/android/internal/telephony/IccFileHandler;

    iget v1, p0, Lcom/android/internal/telephony/AdnRecordLoader;->ef:I

    const/16 v2, 0x9

    iget-object v3, p1, Lcom/android/internal/telephony/AdnRecord;->snes:[Ljava/lang/String;

    const/4 v4, 0x0

    aget-object v3, v3, v4

    invoke-virtual {p0, v2, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/android/internal/telephony/IccFileHandler;->getEFLinearRecordSize(ILandroid/os/Message;)V

    .line 202
    return-void
.end method
