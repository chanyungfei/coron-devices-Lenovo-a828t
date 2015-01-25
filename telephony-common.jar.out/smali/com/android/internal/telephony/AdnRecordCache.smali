.class public final Lcom/android/internal/telephony/AdnRecordCache;
.super Landroid/os/Handler;
.source "AdnRecordCache.java"

# interfaces
.implements Lcom/android/internal/telephony/IccConstants;


# static fields
.field static final EVENT_LOAD_ALL_ADN_LIKE_DONE:I = 0x1

.field static final EVENT_UPDATE_ADN_DONE:I = 0x2

.field static final EVENT_UPDATE_ADN_DONE2:I = 0x4

.field static final EVENT_UPDATE_ANR_DONE:I = 0x5

.field static final EVENT_UPDATE_EMAIL_DONE:I = 0x3

.field static final EVENT_UPDATE_GRP_DONE:I = 0x6

.field static final EVENT_UPDATE_GSD_DONE:I = 0x8

.field static final EVENT_UPDATE_SNE_DONE:I = 0x7

.field static final TAG:Ljava/lang/String; = "AdnRecordCache"

.field public static final USIM_ADN_MATCH_POSITION:Ljava/lang/String; = "usimAdnMatchPosition"

.field private static final VDBG:Z

.field public static mAdnExt1Map:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "[B>;"
        }
    .end annotation
.end field

.field public static mAdnExt2Map:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "[B>;"
        }
    .end annotation
.end field


# instance fields
.field public PBInitCount:I

.field adnLikeFiles:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/internal/telephony/AdnRecord;",
            ">;>;"
        }
    .end annotation
.end field

.field adnLikeWaiters:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/os/Message;",
            ">;>;"
        }
    .end annotation
.end field

.field private mFh:Lcom/android/internal/telephony/IccFileHandler;

.field private mLock:Ljava/lang/Object;

.field private volatile mSimContactsLoaded:Z

.field private mUpdateAnrSuccess:Z

.field private mUpdateEmailSuccess:Z

.field private mUpdateGrpSuccess:Z

.field private mUpdateGsdSuccess:Z

.field private mUpdateSneSuccess:Z

.field private mUsimPhoneBookManager:Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;

.field phone:Lcom/android/internal/telephony/PhoneBase;

.field userWriteResponse:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Landroid/os/Message;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 54
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/android/internal/telephony/AdnRecordCache;->mAdnExt1Map:Ljava/util/Map;

    .line 55
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/android/internal/telephony/AdnRecordCache;->mAdnExt2Map:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>(Lcom/android/internal/telephony/IccFileHandler;)V
    .locals 3
    .parameter "fh"

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 82
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 41
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/internal/telephony/AdnRecordCache;->mLock:Ljava/lang/Object;

    .line 44
    iput-boolean v1, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUpdateEmailSuccess:Z

    .line 45
    iput-boolean v1, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUpdateAnrSuccess:Z

    .line 46
    iput-boolean v1, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUpdateGrpSuccess:Z

    .line 47
    iput-boolean v1, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUpdateSneSuccess:Z

    .line 48
    iput-boolean v1, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUpdateGsdSuccess:Z

    .line 49
    iput v2, p0, Lcom/android/internal/telephony/AdnRecordCache;->PBInitCount:I

    .line 53
    iput-boolean v2, p0, Lcom/android/internal/telephony/AdnRecordCache;->mSimContactsLoaded:Z

    .line 57
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/internal/telephony/AdnRecordCache;->adnLikeFiles:Landroid/util/SparseArray;

    .line 61
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/internal/telephony/AdnRecordCache;->adnLikeWaiters:Landroid/util/SparseArray;

    .line 65
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/internal/telephony/AdnRecordCache;->userWriteResponse:Landroid/util/SparseArray;

    .line 83
    iput-object p1, p0, Lcom/android/internal/telephony/AdnRecordCache;->mFh:Lcom/android/internal/telephony/IccFileHandler;

    .line 84
    new-instance v0, Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;

    iget-object v1, p0, Lcom/android/internal/telephony/AdnRecordCache;->mFh:Lcom/android/internal/telephony/IccFileHandler;

    invoke-direct {v0, v1, p0}, Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;-><init>(Lcom/android/internal/telephony/IccFileHandler;Lcom/android/internal/telephony/AdnRecordCache;)V

    iput-object v0, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUsimPhoneBookManager:Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;

    .line 85
    return-void
.end method

.method private clearUserWriters()V
    .locals 4

    .prologue
    .line 146
    iget-object v2, p0, Lcom/android/internal/telephony/AdnRecordCache;->userWriteResponse:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v1

    .line 147
    .local v1, size:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 148
    iget-object v2, p0, Lcom/android/internal/telephony/AdnRecordCache;->userWriteResponse:Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/Message;

    const-string v3, "AdnCace reset"

    invoke-direct {p0, v2, v3}, Lcom/android/internal/telephony/AdnRecordCache;->sendErrorResponse(Landroid/os/Message;Ljava/lang/String;)V

    .line 147
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 150
    :cond_0
    iget-object v2, p0, Lcom/android/internal/telephony/AdnRecordCache;->userWriteResponse:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->clear()V

    .line 151
    return-void
.end method

.method private clearWaiters()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 136
    iget-object v4, p0, Lcom/android/internal/telephony/AdnRecordCache;->adnLikeWaiters:Landroid/util/SparseArray;

    invoke-virtual {v4}, Landroid/util/SparseArray;->size()I

    move-result v2

    .line 137
    .local v2, size:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 138
    iget-object v4, p0, Lcom/android/internal/telephony/AdnRecordCache;->adnLikeWaiters:Landroid/util/SparseArray;

    invoke-virtual {v4, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/ArrayList;

    .line 139
    .local v3, waiters:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/os/Message;>;"
    new-instance v0, Landroid/os/AsyncResult;

    new-instance v4, Ljava/lang/RuntimeException;

    const-string v5, "AdnCache reset"

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v6, v6, v4}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 140
    .local v0, ar:Landroid/os/AsyncResult;
    invoke-direct {p0, v3, v0}, Lcom/android/internal/telephony/AdnRecordCache;->notifyWaiters(Ljava/util/ArrayList;Landroid/os/AsyncResult;)V

    .line 137
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 142
    .end local v0           #ar:Landroid/os/AsyncResult;
    .end local v3           #waiters:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/os/Message;>;"
    :cond_0
    iget-object v4, p0, Lcom/android/internal/telephony/AdnRecordCache;->adnLikeWaiters:Landroid/util/SparseArray;

    invoke-virtual {v4}, Landroid/util/SparseArray;->clear()V

    .line 143
    return-void
.end method

.method private notifyWaiters(Ljava/util/ArrayList;Landroid/os/AsyncResult;)V
    .locals 5
    .parameter
    .parameter "ar"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/os/Message;",
            ">;",
            "Landroid/os/AsyncResult;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1161
    .local p1, waiters:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/os/Message;>;"
    if-nez p1, :cond_1

    .line 1171
    :cond_0
    return-void

    .line 1165
    :cond_1
    const/4 v0, 0x0

    .local v0, i:I
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    .local v1, s:I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 1166
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/Message;

    .line 1168
    .local v2, waiter:Landroid/os/Message;
    iget-object v3, p2, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    iget-object v4, p2, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-static {v2, v3, v4}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 1169
    invoke-virtual {v2}, Landroid/os/Message;->sendToTarget()V

    .line 1165
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private sendErrorResponse(Landroid/os/Message;Ljava/lang/String;)V
    .locals 2
    .parameter "response"
    .parameter "errString"

    .prologue
    .line 196
    if-eqz p1, :cond_0

    .line 197
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 198
    .local v0, e:Ljava/lang/Exception;
    invoke-static {p1}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;)Landroid/os/AsyncResult;

    move-result-object v1

    iput-object v0, v1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    .line 199
    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    .line 201
    .end local v0           #e:Ljava/lang/Exception;
    :cond_0
    return-void
.end method

.method private updateAdnEmail(Lcom/android/internal/telephony/AdnRecord;IILjava/lang/String;I)V
    .locals 10
    .parameter "adn"
    .parameter "emailIndex"
    .parameter "recNum"
    .parameter "pin2"
    .parameter "whichone"

    .prologue
    .line 992
    const-string v0, "AdnRecordCache"

    const-string v1, "begin updateAdnEmail()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 994
    iget-object v9, p0, Lcom/android/internal/telephony/AdnRecordCache;->mLock:Ljava/lang/Object;

    monitor-enter v9

    .line 996
    :try_start_0
    iget-object v0, p1, Lcom/android/internal/telephony/AdnRecord;->emailEfids:[I

    aget v2, v0, p5

    .line 997
    .local v2, emailEF:I
    if-gez v2, :cond_0

    .line 998
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUpdateEmailSuccess:Z

    .line 999
    monitor-exit v9

    .line 1017
    :goto_0
    return-void

    .line 1001
    :cond_0
    const-string v0, "AdnRecordCache"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "emailEF = "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1003
    const/4 v0, -0x1

    if-eq p2, v0, :cond_1

    if-nez p2, :cond_2

    .line 1004
    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUpdateEmailSuccess:Z

    .line 1005
    monitor-exit v9

    goto :goto_0

    .line 1016
    .end local v2           #emailEF:I
    :catchall_0
    move-exception v0

    monitor-exit v9
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 1008
    .restart local v2       #emailEF:I
    :cond_2
    :try_start_1
    iget-object v0, p1, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    aget-object v8, v0, p5

    .line 1009
    .local v8, email:Ljava/lang/String;
    new-instance v0, Lcom/android/internal/telephony/AdnRecordLoader;

    iget-object v1, p0, Lcom/android/internal/telephony/AdnRecordCache;->mFh:Lcom/android/internal/telephony/IccFileHandler;

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/AdnRecordLoader;-><init>(Lcom/android/internal/telephony/IccFileHandler;)V

    iget v4, p1, Lcom/android/internal/telephony/AdnRecord;->recordNumber:I

    const/4 v1, 0x3

    invoke-virtual {p0, v1, p3, p2, p1}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v6

    move-object v1, p1

    move v3, p2

    move-object v5, p4

    invoke-virtual/range {v0 .. v6}, Lcom/android/internal/telephony/AdnRecordLoader;->updateEmailEF(Lcom/android/internal/telephony/AdnRecord;IIILjava/lang/String;Landroid/os/Message;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1012
    :try_start_2
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecordCache;->mLock:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->wait()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    .line 1016
    :goto_1
    :try_start_3
    monitor-exit v9

    goto :goto_0

    .line 1013
    :catch_0
    move-exception v7

    .line 1014
    .local v7, e:Ljava/lang/InterruptedException;
    const-string v0, "AdnRecordCache"

    const-string v1, "Interrupted Exception in updateAdnEmail"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1
.end method

.method private updateAdnGrp(Lcom/android/internal/telephony/AdnRecord;IILjava/lang/String;)V
    .locals 8
    .parameter "adn"
    .parameter "grpIndex"
    .parameter "recNum"
    .parameter "pin2"

    .prologue
    .line 943
    const-string v0, "AdnRecordCache"

    const-string v1, "begin updateAdnGrp()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 944
    iget-object v7, p0, Lcom/android/internal/telephony/AdnRecordCache;->mLock:Ljava/lang/Object;

    monitor-enter v7

    .line 946
    :try_start_0
    invoke-virtual {p1}, Lcom/android/internal/telephony/AdnRecord;->getGrpEfid()I

    move-result v2

    .line 947
    .local v2, grpEF:I
    if-gez v2, :cond_0

    .line 948
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUpdateGrpSuccess:Z

    .line 949
    monitor-exit v7

    .line 966
    :goto_0
    return-void

    .line 951
    :cond_0
    const-string v0, "AdnRecordCache"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "grpEF = "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 953
    const/4 v0, -0x1

    if-eq p2, v0, :cond_1

    if-nez p2, :cond_2

    .line 954
    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUpdateGrpSuccess:Z

    .line 955
    monitor-exit v7

    goto :goto_0

    .line 965
    .end local v2           #grpEF:I
    :catchall_0
    move-exception v0

    monitor-exit v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 958
    .restart local v2       #grpEF:I
    :cond_2
    :try_start_1
    new-instance v0, Lcom/android/internal/telephony/AdnRecordLoader;

    iget-object v1, p0, Lcom/android/internal/telephony/AdnRecordCache;->mFh:Lcom/android/internal/telephony/IccFileHandler;

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/AdnRecordLoader;-><init>(Lcom/android/internal/telephony/IccFileHandler;)V

    const/4 v1, 0x6

    invoke-virtual {p0, v1, p3, p2, p1}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v5

    move-object v1, p1

    move v3, p2

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/android/internal/telephony/AdnRecordLoader;->updateGrpEF(Lcom/android/internal/telephony/AdnRecord;IILjava/lang/String;Landroid/os/Message;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 961
    :try_start_2
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecordCache;->mLock:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->wait()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    .line 965
    :goto_1
    :try_start_3
    monitor-exit v7

    goto :goto_0

    .line 962
    :catch_0
    move-exception v6

    .line 963
    .local v6, e:Ljava/lang/InterruptedException;
    const-string v0, "AdnRecordCache"

    const-string v1, "Interrupted Exception in updateAdnGrp"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1
.end method

.method private updateEfByIndexes(IIIILcom/android/internal/telephony/AdnRecord;Lcom/android/internal/telephony/AdnRecord;Ljava/util/ArrayList;ZZZZZIIIIIILjava/lang/String;Landroid/os/Message;)V
    .locals 20
    .parameter "index"
    .parameter "efid"
    .parameter "extensionEF"
    .parameter "emailEfid2nd"
    .parameter "oldAdn"
    .parameter "newAdn"
    .parameter
    .parameter "needUpdateEmail"
    .parameter "needUpdateEmail2nd"
    .parameter "needUpdateAnr"
    .parameter "needUpdateSne"
    .parameter "needUpdateGrp"
    .parameter "pbrRecordNum"
    .parameter "emailIndex"
    .parameter "emailIndex2nd"
    .parameter "anrIndex"
    .parameter "sneIndex"
    .parameter "grpIndex"
    .parameter "pin2"
    .parameter "response"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IIII",
            "Lcom/android/internal/telephony/AdnRecord;",
            "Lcom/android/internal/telephony/AdnRecord;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/internal/telephony/AdnRecord;",
            ">;ZZZZZIIIIII",
            "Ljava/lang/String;",
            "Landroid/os/Message;",
            ")V"
        }
    .end annotation

    .prologue
    .line 676
    .local p7, oldAdnList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/internal/telephony/AdnRecord;>;"
    move/from16 v18, p1

    .line 677
    .local v18, oldIndex:I
    move/from16 v17, p2

    .line 678
    .local v17, oldEfid:I
    const/4 v5, 0x2

    new-array v14, v5, [I

    fill-array-data v14, :array_0

    .line 679
    .local v14, foundAdnEmailIndexes:[I
    const/4 v13, 0x0

    .line 680
    .local v13, foundAdn:Lcom/android/internal/telephony/AdnRecord;
    add-int/lit8 v5, p1, -0x1

    move-object/from16 v0, p7

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    .end local v13           #foundAdn:Lcom/android/internal/telephony/AdnRecord;
    check-cast v13, Lcom/android/internal/telephony/AdnRecord;

    .line 681
    .restart local v13       #foundAdn:Lcom/android/internal/telephony/AdnRecord;
    const/16 v5, 0x4f30

    move/from16 v0, p2

    if-ne v0, v5, :cond_19

    .line 682
    iget v0, v13, Lcom/android/internal/telephony/AdnRecord;->efid:I

    move/from16 p2, v0

    .line 683
    iget v0, v13, Lcom/android/internal/telephony/AdnRecord;->recordNumber:I

    move/from16 p1, v0

    .line 685
    const/4 v5, 0x2

    new-array v15, v5, [I

    fill-array-data v15, :array_1

    .line 686
    .local v15, newEmailEfids:[I
    iget-object v5, v13, Lcom/android/internal/telephony/AdnRecord;->emailEfids:[I

    if-eqz v5, :cond_0

    .line 687
    const/4 v5, 0x0

    iget-object v6, v13, Lcom/android/internal/telephony/AdnRecord;->emailEfids:[I

    const/4 v7, 0x0

    aget v6, v6, v7

    aput v6, v15, v5

    .line 689
    :cond_0
    iget-object v5, v13, Lcom/android/internal/telephony/AdnRecord;->emailEfids:[I

    if-eqz v5, :cond_1

    move-object/from16 v0, p6

    iget-object v5, v0, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    array-length v5, v5

    const/4 v6, 0x1

    if-le v5, v6, :cond_1

    .line 690
    iget-object v5, v13, Lcom/android/internal/telephony/AdnRecord;->emailEfids:[I

    array-length v5, v5

    const/4 v6, 0x1

    if-le v5, v6, :cond_11

    .line 691
    const/4 v5, 0x1

    iget-object v6, v13, Lcom/android/internal/telephony/AdnRecord;->emailEfids:[I

    const/4 v7, 0x1

    aget v6, v6, v7

    const/4 v7, -0x1

    if-ne v6, v7, :cond_10

    .end local p4
    :goto_0
    aput p4, v15, v5

    .line 696
    :cond_1
    :goto_1
    iget-object v5, v13, Lcom/android/internal/telephony/AdnRecord;->emailEfids:[I

    if-eqz v5, :cond_2

    .line 697
    move-object/from16 v0, p6

    invoke-virtual {v0, v15}, Lcom/android/internal/telephony/AdnRecord;->setEmailEfids([I)V

    .line 700
    :cond_2
    iget-object v5, v13, Lcom/android/internal/telephony/AdnRecord;->anrEfids:[I

    if-eqz v5, :cond_3

    .line 701
    const/4 v5, 0x1

    new-array v5, v5, [I

    const/4 v6, 0x0

    iget-object v7, v13, Lcom/android/internal/telephony/AdnRecord;->anrEfids:[I

    const/4 v8, 0x0

    aget v7, v7, v8

    aput v7, v5, v6

    move-object/from16 v0, p6

    invoke-virtual {v0, v5}, Lcom/android/internal/telephony/AdnRecord;->setAnrEfids([I)V

    .line 703
    :cond_3
    iget-object v5, v13, Lcom/android/internal/telephony/AdnRecord;->sneEfids:[I

    if-eqz v5, :cond_4

    .line 704
    const/4 v5, 0x1

    new-array v5, v5, [I

    const/4 v6, 0x0

    iget-object v7, v13, Lcom/android/internal/telephony/AdnRecord;->sneEfids:[I

    const/4 v8, 0x0

    aget v7, v7, v8

    aput v7, v5, v6

    move-object/from16 v0, p6

    invoke-virtual {v0, v5}, Lcom/android/internal/telephony/AdnRecord;->setSneEfids([I)V

    .line 707
    :cond_4
    iget-object v5, v13, Lcom/android/internal/telephony/AdnRecord;->emailIndexes:[I

    if-eqz v5, :cond_8

    .line 708
    const/4 v5, 0x0

    aput p14, v14, v5

    .line 710
    iget-object v5, v13, Lcom/android/internal/telephony/AdnRecord;->emailIndexes:[I

    array-length v5, v5

    const/4 v6, 0x1

    if-le v5, v6, :cond_12

    iget-object v5, v13, Lcom/android/internal/telephony/AdnRecord;->emailIndexes:[I

    const/4 v6, 0x1

    aget v5, v5, v6

    const/4 v6, -0x1

    if-ne v5, v6, :cond_12

    .line 711
    const/4 v5, 0x1

    aput p15, v14, v5

    .line 718
    :cond_5
    :goto_2
    const/4 v5, 0x2

    new-array v0, v5, [I

    move-object/from16 v16, v0

    fill-array-data v16, :array_2

    .line 719
    .local v16, newEmailIndexes:[I
    move-object/from16 v0, p6

    iget-object v5, v0, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    if-eqz v5, :cond_6

    move-object/from16 v0, p6

    iget-object v5, v0, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    const/4 v6, 0x0

    aget-object v5, v5, v6

    if-eqz v5, :cond_6

    move-object/from16 v0, p6

    iget-object v5, v0, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    const/4 v6, 0x0

    aget-object v5, v5, v6

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_14

    .line 720
    :cond_6
    const/4 v5, 0x0

    const/4 v6, -0x1

    aput v6, v16, v5

    .line 724
    :goto_3
    move-object/from16 v0, p6

    iget-object v5, v0, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    if-eqz v5, :cond_16

    move-object/from16 v0, p6

    iget-object v5, v0, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    array-length v5, v5

    const/4 v6, 0x1

    if-le v5, v6, :cond_16

    .line 725
    move-object/from16 v0, p6

    iget-object v5, v0, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    const/4 v6, 0x1

    aget-object v5, v5, v6

    if-eqz v5, :cond_7

    move-object/from16 v0, p6

    iget-object v5, v0, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    const/4 v6, 0x1

    aget-object v5, v5, v6

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_15

    .line 726
    :cond_7
    const/4 v5, 0x1

    const/4 v6, -0x1

    aput v6, v16, v5

    .line 733
    :goto_4
    move-object/from16 v0, p6

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/AdnRecord;->setEmailIndexes([I)V

    .line 736
    .end local v16           #newEmailIndexes:[I
    :cond_8
    move-object/from16 v0, p6

    iget-object v5, v0, Lcom/android/internal/telephony/AdnRecord;->anrs:[Ljava/lang/String;

    const/4 v6, 0x0

    aget-object v5, v5, v6

    if-eqz v5, :cond_9

    move-object/from16 v0, p6

    iget-object v5, v0, Lcom/android/internal/telephony/AdnRecord;->anrs:[Ljava/lang/String;

    const/4 v6, 0x0

    aget-object v5, v5, v6

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_17

    .line 737
    :cond_9
    const/4 v5, 0x1

    new-array v5, v5, [I

    const/4 v6, 0x0

    const/4 v7, -0x1

    aput v7, v5, v6

    move-object/from16 v0, p6

    invoke-virtual {v0, v5}, Lcom/android/internal/telephony/AdnRecord;->setAnrIndexes([I)V

    .line 741
    :goto_5
    const-string v5, "AdnRecordCache"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, " sneIndex = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move/from16 v0, p17

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 743
    move-object/from16 v0, p6

    iget-object v5, v0, Lcom/android/internal/telephony/AdnRecord;->snes:[Ljava/lang/String;

    const/4 v6, 0x0

    aget-object v5, v5, v6

    if-eqz v5, :cond_a

    move-object/from16 v0, p6

    iget-object v5, v0, Lcom/android/internal/telephony/AdnRecord;->snes:[Ljava/lang/String;

    const/4 v6, 0x0

    aget-object v5, v5, v6

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_18

    .line 744
    :cond_a
    const/4 v5, 0x1

    new-array v5, v5, [I

    const/4 v6, 0x0

    const/4 v7, -0x1

    aput v7, v5, v6

    move-object/from16 v0, p6

    invoke-virtual {v0, v5}, Lcom/android/internal/telephony/AdnRecord;->setSneIndexes([I)V

    .line 749
    :goto_6
    iget v5, v13, Lcom/android/internal/telephony/AdnRecord;->grpEfid:I

    const/4 v6, -0x1

    if-eq v5, v6, :cond_b

    .line 750
    iget v5, v13, Lcom/android/internal/telephony/AdnRecord;->grpEfid:I

    move-object/from16 v0, p6

    invoke-virtual {v0, v5}, Lcom/android/internal/telephony/AdnRecord;->setGrpEfid(I)V

    .line 753
    :cond_b
    const/4 v5, 0x2

    new-array v12, v5, [I

    fill-array-data v12, :array_3

    .line 754
    .local v12, emailFiletypes:[I
    iget-object v5, v13, Lcom/android/internal/telephony/AdnRecord;->emailFileTypes:[I

    if-eqz v5, :cond_c

    .line 755
    const/4 v5, 0x0

    iget-object v6, v13, Lcom/android/internal/telephony/AdnRecord;->emailFileTypes:[I

    const/4 v7, 0x0

    aget v6, v6, v7

    aput v6, v12, v5

    .line 757
    :cond_c
    iget-object v5, v13, Lcom/android/internal/telephony/AdnRecord;->emailFileTypes:[I

    if-eqz v5, :cond_d

    const/4 v5, -0x1

    move/from16 v0, p15

    if-eq v0, v5, :cond_d

    .line 758
    const/4 v5, 0x1

    const/16 v6, 0xa9

    aput v6, v12, v5

    .line 760
    :cond_d
    move-object/from16 v0, p6

    invoke-virtual {v0, v12}, Lcom/android/internal/telephony/AdnRecord;->setEmailFileTypes([I)V

    .line 762
    iget-object v5, v13, Lcom/android/internal/telephony/AdnRecord;->anrFileTypes:[I

    if-eqz v5, :cond_e

    .line 763
    const/4 v5, 0x1

    new-array v5, v5, [I

    const/4 v6, 0x0

    iget-object v7, v13, Lcom/android/internal/telephony/AdnRecord;->anrFileTypes:[I

    const/4 v8, 0x0

    aget v7, v7, v8

    aput v7, v5, v6

    move-object/from16 v0, p6

    invoke-virtual {v0, v5}, Lcom/android/internal/telephony/AdnRecord;->setAnrFileTypes([I)V

    .line 766
    :cond_e
    iget-object v5, v13, Lcom/android/internal/telephony/AdnRecord;->sneFileTypes:[I

    if-eqz v5, :cond_f

    .line 767
    const/4 v5, 0x1

    new-array v5, v5, [I

    const/4 v6, 0x0

    iget-object v7, v13, Lcom/android/internal/telephony/AdnRecord;->sneFileTypes:[I

    const/4 v8, 0x0

    aget v7, v7, v8

    aput v7, v5, v6

    move-object/from16 v0, p6

    invoke-virtual {v0, v5}, Lcom/android/internal/telephony/AdnRecord;->setSneFileTypes([I)V

    .line 769
    :cond_f
    move/from16 v0, p2

    move-object/from16 v1, p6

    iput v0, v1, Lcom/android/internal/telephony/AdnRecord;->efid:I

    .line 770
    iget v5, v13, Lcom/android/internal/telephony/AdnRecord;->extRecord:I

    move-object/from16 v0, p6

    iput v5, v0, Lcom/android/internal/telephony/AdnRecord;->extRecord:I

    .line 771
    iget v5, v13, Lcom/android/internal/telephony/AdnRecord;->extRecordAnr0:I

    move-object/from16 v0, p6

    iput v5, v0, Lcom/android/internal/telephony/AdnRecord;->extRecordAnr0:I

    .line 772
    move/from16 v0, p1

    move-object/from16 v1, p6

    iput v0, v1, Lcom/android/internal/telephony/AdnRecord;->recordNumber:I

    .line 783
    .end local v12           #emailFiletypes:[I
    .end local v15           #newEmailEfids:[I
    :goto_7
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/internal/telephony/AdnRecordCache;->userWriteResponse:Landroid/util/SparseArray;

    move/from16 v0, v17

    invoke-virtual {v5, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Landroid/os/Message;

    .line 785
    .local v19, pendingResponse:Landroid/os/Message;
    if-eqz v19, :cond_1a

    .line 786
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Have pending update for EF:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move/from16 v0, v17

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p0

    move-object/from16 v1, p20

    invoke-direct {v0, v1, v5}, Lcom/android/internal/telephony/AdnRecordCache;->sendErrorResponse(Landroid/os/Message;Ljava/lang/String;)V

    .line 821
    :goto_8
    return-void

    .line 691
    .end local v19           #pendingResponse:Landroid/os/Message;
    .restart local v15       #newEmailEfids:[I
    .restart local p4
    :cond_10
    iget-object v6, v13, Lcom/android/internal/telephony/AdnRecord;->emailEfids:[I

    const/4 v7, 0x1

    aget p4, v6, v7

    goto/16 :goto_0

    .line 693
    :cond_11
    const/4 v5, 0x1

    aput p4, v15, v5

    goto/16 :goto_1

    .line 712
    .end local p4
    :cond_12
    iget-object v5, v13, Lcom/android/internal/telephony/AdnRecord;->emailIndexes:[I

    array-length v5, v5

    const/4 v6, 0x1

    if-le v5, v6, :cond_13

    iget-object v5, v13, Lcom/android/internal/telephony/AdnRecord;->emailIndexes:[I

    const/4 v6, 0x1

    aget v5, v5, v6

    const/4 v6, -0x1

    if-eq v5, v6, :cond_13

    .line 713
    const/4 v5, 0x1

    iget-object v6, v13, Lcom/android/internal/telephony/AdnRecord;->emailIndexes:[I

    const/4 v7, 0x1

    aget v6, v6, v7

    aput v6, v14, v5

    goto/16 :goto_2

    .line 714
    :cond_13
    iget-object v5, v13, Lcom/android/internal/telephony/AdnRecord;->emailIndexes:[I

    array-length v5, v5

    const/4 v6, 0x1

    if-gt v5, v6, :cond_5

    .line 715
    const/4 v5, 0x1

    aput p15, v14, v5

    goto/16 :goto_2

    .line 722
    .restart local v16       #newEmailIndexes:[I
    :cond_14
    const/4 v5, 0x0

    const/4 v6, 0x0

    aget v6, v14, v6

    aput v6, v16, v5

    goto/16 :goto_3

    .line 728
    :cond_15
    const/4 v5, 0x1

    aput p15, v16, v5

    goto/16 :goto_4

    .line 731
    :cond_16
    const/4 v5, 0x1

    const/4 v6, -0x1

    aput v6, v16, v5

    goto/16 :goto_4

    .line 739
    .end local v16           #newEmailIndexes:[I
    :cond_17
    const/4 v5, 0x1

    new-array v5, v5, [I

    const/4 v6, 0x0

    aput p16, v5, v6

    move-object/from16 v0, p6

    invoke-virtual {v0, v5}, Lcom/android/internal/telephony/AdnRecord;->setAnrIndexes([I)V

    goto/16 :goto_5

    .line 746
    :cond_18
    const/4 v5, 0x1

    new-array v5, v5, [I

    const/4 v6, 0x0

    aput p17, v5, v6

    move-object/from16 v0, p6

    invoke-virtual {v0, v5}, Lcom/android/internal/telephony/AdnRecord;->setSneIndexes([I)V

    goto/16 :goto_6

    .line 774
    .end local v15           #newEmailEfids:[I
    .restart local p4
    :cond_19
    const/4 v5, 0x0

    move-object/from16 v0, p6

    iput-object v5, v0, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    .line 775
    const/4 v5, 0x0

    move-object/from16 v0, p6

    iput-object v5, v0, Lcom/android/internal/telephony/AdnRecord;->anrs:[Ljava/lang/String;

    .line 776
    const/4 v5, 0x0

    move-object/from16 v0, p6

    iput-object v5, v0, Lcom/android/internal/telephony/AdnRecord;->grps:[B

    .line 777
    const/4 v5, 0x0

    move-object/from16 v0, p6

    iput-object v5, v0, Lcom/android/internal/telephony/AdnRecord;->snes:[Ljava/lang/String;

    .line 778
    move/from16 v0, p2

    move-object/from16 v1, p6

    iput v0, v1, Lcom/android/internal/telephony/AdnRecord;->efid:I

    .line 779
    iget v5, v13, Lcom/android/internal/telephony/AdnRecord;->extRecord:I

    move-object/from16 v0, p6

    iput v5, v0, Lcom/android/internal/telephony/AdnRecord;->extRecord:I

    .line 780
    move/from16 v0, p1

    move-object/from16 v1, p6

    iput v0, v1, Lcom/android/internal/telephony/AdnRecord;->recordNumber:I

    goto/16 :goto_7

    .line 790
    .end local p4
    .restart local v19       #pendingResponse:Landroid/os/Message;
    :cond_1a
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/internal/telephony/AdnRecordCache;->userWriteResponse:Landroid/util/SparseArray;

    move/from16 v0, v17

    move-object/from16 v1, p20

    invoke-virtual {v5, v0, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 791
    const/16 v5, 0x4f30

    move/from16 v0, v17

    if-ne v0, v5, :cond_1b

    .line 792
    if-eqz p8, :cond_1c

    .line 793
    const/4 v5, 0x0

    aget v7, v14, v5

    const/4 v10, 0x0

    move-object/from16 v5, p0

    move-object/from16 v6, p6

    move/from16 v8, p13

    move-object/from16 v9, p19

    invoke-direct/range {v5 .. v10}, Lcom/android/internal/telephony/AdnRecordCache;->updateAdnEmail(Lcom/android/internal/telephony/AdnRecord;IILjava/lang/String;I)V

    .line 797
    :goto_9
    if-eqz p9, :cond_1d

    .line 798
    const/4 v5, 0x1

    aget v7, v14, v5

    const/4 v10, 0x1

    move-object/from16 v5, p0

    move-object/from16 v6, p6

    move/from16 v8, p13

    move-object/from16 v9, p19

    invoke-direct/range {v5 .. v10}, Lcom/android/internal/telephony/AdnRecordCache;->updateAdnEmail(Lcom/android/internal/telephony/AdnRecord;IILjava/lang/String;I)V

    .line 802
    :goto_a
    if-eqz p10, :cond_1e

    move-object/from16 v5, p0

    move-object/from16 v6, p6

    move/from16 v7, p3

    move/from16 v8, p16

    move/from16 v9, p13

    move-object/from16 v10, p19

    .line 803
    invoke-virtual/range {v5 .. v10}, Lcom/android/internal/telephony/AdnRecordCache;->updateAdnAnr(Lcom/android/internal/telephony/AdnRecord;IIILjava/lang/String;)V

    .line 807
    :goto_b
    if-eqz p11, :cond_1f

    .line 808
    move-object/from16 v0, p0

    move-object/from16 v1, p6

    move/from16 v2, p17

    move/from16 v3, p13

    move-object/from16 v4, p19

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/android/internal/telephony/AdnRecordCache;->updateAdnSne(Lcom/android/internal/telephony/AdnRecord;IILjava/lang/String;)V

    .line 812
    :goto_c
    if-eqz p12, :cond_20

    .line 813
    move-object/from16 v0, p0

    move-object/from16 v1, p6

    move/from16 v2, p18

    move/from16 v3, p13

    move-object/from16 v4, p19

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/android/internal/telephony/AdnRecordCache;->updateAdnGrp(Lcom/android/internal/telephony/AdnRecord;IILjava/lang/String;)V

    .line 818
    :cond_1b
    :goto_d
    new-instance v5, Lcom/android/internal/telephony/AdnRecordLoader;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/internal/telephony/AdnRecordCache;->mFh:Lcom/android/internal/telephony/IccFileHandler;

    invoke-direct {v5, v6}, Lcom/android/internal/telephony/AdnRecordLoader;-><init>(Lcom/android/internal/telephony/IccFileHandler;)V

    const/4 v6, 0x4

    move-object/from16 v0, p0

    move/from16 v1, v18

    move/from16 v2, v17

    move-object/from16 v3, p6

    invoke-virtual {v0, v6, v1, v2, v3}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v11

    move-object/from16 v6, p6

    move/from16 v7, p2

    move/from16 v8, p3

    move/from16 v9, p1

    move-object/from16 v10, p19

    invoke-virtual/range {v5 .. v11}, Lcom/android/internal/telephony/AdnRecordLoader;->updateEF(Lcom/android/internal/telephony/AdnRecord;IIILjava/lang/String;Landroid/os/Message;)V

    goto/16 :goto_8

    .line 795
    :cond_1c
    const/4 v5, 0x1

    move-object/from16 v0, p0

    iput-boolean v5, v0, Lcom/android/internal/telephony/AdnRecordCache;->mUpdateEmailSuccess:Z

    goto :goto_9

    .line 800
    :cond_1d
    const/4 v5, 0x1

    move-object/from16 v0, p0

    iput-boolean v5, v0, Lcom/android/internal/telephony/AdnRecordCache;->mUpdateEmailSuccess:Z

    goto :goto_a

    .line 805
    :cond_1e
    const/4 v5, 0x1

    move-object/from16 v0, p0

    iput-boolean v5, v0, Lcom/android/internal/telephony/AdnRecordCache;->mUpdateAnrSuccess:Z

    goto :goto_b

    .line 810
    :cond_1f
    const/4 v5, 0x1

    move-object/from16 v0, p0

    iput-boolean v5, v0, Lcom/android/internal/telephony/AdnRecordCache;->mUpdateSneSuccess:Z

    goto :goto_c

    .line 815
    :cond_20
    const/4 v5, 0x1

    move-object/from16 v0, p0

    iput-boolean v5, v0, Lcom/android/internal/telephony/AdnRecordCache;->mUpdateGrpSuccess:Z

    goto :goto_d

    .line 678
    nop

    :array_0
    .array-data 0x4
        0xfft 0xfft 0xfft 0xfft
        0xfft 0xfft 0xfft 0xfft
    .end array-data

    .line 685
    :array_1
    .array-data 0x4
        0xfft 0xfft 0xfft 0xfft
        0xfft 0xfft 0xfft 0xfft
    .end array-data

    .line 718
    :array_2
    .array-data 0x4
        0xfft 0xfft 0xfft 0xfft
        0xfft 0xfft 0xfft 0xfft
    .end array-data

    .line 753
    :array_3
    .array-data 0x4
        0xfft 0xfft 0xfft 0xfft
        0xfft 0xfft 0xfft 0xfft
    .end array-data
.end method

.method private updateGsdTag(IILjava/lang/String;Ljava/lang/String;)V
    .locals 8
    .parameter "gspEf"
    .parameter "grpId"
    .parameter "grpTag"
    .parameter "pin2"

    .prologue
    .line 969
    const-string v0, "AdnRecordCache"

    const-string v1, "begin updateGsdTag()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 970
    iget-object v7, p0, Lcom/android/internal/telephony/AdnRecordCache;->mLock:Ljava/lang/Object;

    monitor-enter v7

    .line 971
    if-gez p1, :cond_0

    .line 972
    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUpdateGsdSuccess:Z

    .line 973
    monitor-exit v7

    .line 989
    :goto_0
    return-void

    .line 976
    :cond_0
    const/4 v0, -0x1

    if-eq p2, v0, :cond_1

    if-nez p2, :cond_2

    .line 977
    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUpdateGsdSuccess:Z

    .line 978
    monitor-exit v7

    goto :goto_0

    .line 988
    :catchall_0
    move-exception v0

    monitor-exit v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 981
    :cond_2
    :try_start_1
    new-instance v0, Lcom/android/internal/telephony/AdnRecordLoader;

    iget-object v1, p0, Lcom/android/internal/telephony/AdnRecordCache;->mFh:Lcom/android/internal/telephony/IccFileHandler;

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/AdnRecordLoader;-><init>(Lcom/android/internal/telephony/IccFileHandler;)V

    const/16 v1, 0x8

    invoke-virtual {p0, v1, p1, p2, p3}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v5

    move v1, p1

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/android/internal/telephony/AdnRecordLoader;->updateGsdEF(IILjava/lang/String;Ljava/lang/String;Landroid/os/Message;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 984
    :try_start_2
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecordCache;->mLock:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->wait()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    .line 988
    :goto_1
    :try_start_3
    monitor-exit v7

    goto :goto_0

    .line 985
    :catch_0
    move-exception v6

    .line 986
    .local v6, e:Ljava/lang/InterruptedException;
    const-string v0, "AdnRecordCache"

    const-string v1, "Interrupted Exception in updateGsdTag"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1
.end method


# virtual methods
.method extensionEfForEf(I)I
    .locals 1
    .parameter "efid"

    .prologue
    const/16 v0, 0x6f4a

    .line 184
    sparse-switch p1, :sswitch_data_0

    .line 191
    const/4 v0, -0x1

    :goto_0
    :sswitch_0
    return v0

    .line 185
    :sswitch_1
    const/16 v0, 0x6fc8

    goto :goto_0

    .line 187
    :sswitch_2
    const/16 v0, 0x6f4c

    goto :goto_0

    .line 188
    :sswitch_3
    const/16 v0, 0x6f4b

    goto :goto_0

    .line 190
    :sswitch_4
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUsimPhoneBookManager:Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;

    iget v0, v0, Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;->extEf:I

    goto :goto_0

    .line 184
    nop

    :sswitch_data_0
    .sparse-switch
        0x4f30 -> :sswitch_4
        0x6f3a -> :sswitch_0
        0x6f3b -> :sswitch_3
        0x6f40 -> :sswitch_0
        0x6f49 -> :sswitch_2
        0x6fc7 -> :sswitch_1
    .end sparse-switch
.end method

.method public getEmailFieldSize()I
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 125
    iget-object v1, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUsimPhoneBookManager:Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;

    if-nez v1, :cond_0

    .line 127
    :goto_0
    return v0

    :cond_0
    iget-object v1, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUsimPhoneBookManager:Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;

    invoke-virtual {v1, v0}, Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;->getEmailNumInOneRecord(I)I

    move-result v0

    goto :goto_0
.end method

.method public getRecordsIfLoaded(I)Ljava/util/ArrayList;
    .locals 1
    .parameter "efid"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/internal/telephony/AdnRecord;",
            ">;"
        }
    .end annotation

    .prologue
    .line 174
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecordCache;->adnLikeFiles:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    return-object v0
.end method

.method public getTotalAdnRecordsSize(I)I
    .locals 4
    .parameter "efid"

    .prologue
    const/16 v3, 0x6f3a

    const/4 v1, 0x0

    .line 154
    if-ne p1, v3, :cond_1

    .line 155
    iget-object v2, p0, Lcom/android/internal/telephony/AdnRecordCache;->adnLikeFiles:Landroid/util/SparseArray;

    invoke-virtual {v2, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 156
    iget-object v1, p0, Lcom/android/internal/telephony/AdnRecordCache;->adnLikeFiles:Landroid/util/SparseArray;

    invoke-virtual {v1, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 164
    :cond_0
    :goto_0
    return v1

    .line 160
    :cond_1
    const/16 v2, 0x4f30

    if-ne p1, v2, :cond_0

    .line 161
    iget-object v2, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUsimPhoneBookManager:Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;

    invoke-virtual {v2}, Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;->getUsimPhoneBook()Ljava/util/ArrayList;

    move-result-object v0

    .line 162
    .local v0, oldAdnList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/internal/telephony/AdnRecord;>;"
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    goto :goto_0
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 14
    .parameter "msg"

    .prologue
    .line 1180
    iget v11, p1, Landroid/os/Message;->what:I

    packed-switch v11, :pswitch_data_0

    .line 1339
    :goto_0
    return-void

    .line 1183
    :pswitch_0
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Landroid/os/AsyncResult;

    .line 1184
    .local v1, ar:Landroid/os/AsyncResult;
    iget v2, p1, Landroid/os/Message;->arg1:I

    .line 1187
    .local v2, efid:I
    iget-object v11, p0, Lcom/android/internal/telephony/AdnRecordCache;->adnLikeWaiters:Landroid/util/SparseArray;

    invoke-virtual {v11, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/ArrayList;

    .line 1188
    .local v10, waiters:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/os/Message;>;"
    iget-object v11, p0, Lcom/android/internal/telephony/AdnRecordCache;->adnLikeWaiters:Landroid/util/SparseArray;

    invoke-virtual {v11, v2}, Landroid/util/SparseArray;->delete(I)V

    .line 1190
    iget-object v11, v1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-nez v11, :cond_0

    .line 1191
    iget-object v12, p0, Lcom/android/internal/telephony/AdnRecordCache;->adnLikeFiles:Landroid/util/SparseArray;

    iget-object v11, v1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v11, Ljava/util/ArrayList;

    invoke-virtual {v12, v2, v11}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 1193
    :cond_0
    invoke-direct {p0, v10, v1}, Lcom/android/internal/telephony/AdnRecordCache;->notifyWaiters(Ljava/util/ArrayList;Landroid/os/AsyncResult;)V

    goto :goto_0

    .line 1196
    .end local v1           #ar:Landroid/os/AsyncResult;
    .end local v2           #efid:I
    .end local v10           #waiters:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/os/Message;>;"
    :pswitch_1
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Landroid/os/AsyncResult;

    .line 1197
    .restart local v1       #ar:Landroid/os/AsyncResult;
    iget v2, p1, Landroid/os/Message;->arg1:I

    .line 1198
    .restart local v2       #efid:I
    iget v5, p1, Landroid/os/Message;->arg2:I

    .line 1199
    .local v5, index:I
    iget-object v11, v1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v11, Lcom/android/internal/telephony/AdnRecord;

    move-object v0, v11

    check-cast v0, Lcom/android/internal/telephony/AdnRecord;

    .line 1201
    .local v0, adn:Lcom/android/internal/telephony/AdnRecord;
    iget-object v11, v1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-nez v11, :cond_1

    .line 1202
    iget-object v11, p0, Lcom/android/internal/telephony/AdnRecordCache;->adnLikeFiles:Landroid/util/SparseArray;

    invoke-virtual {v11, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/ArrayList;

    add-int/lit8 v12, v5, -0x1

    invoke-virtual {v11, v12, v0}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 1203
    iget-object v11, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUsimPhoneBookManager:Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;

    invoke-virtual {v11}, Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;->invalidateCache()V

    .line 1206
    :cond_1
    iget-object v11, p0, Lcom/android/internal/telephony/AdnRecordCache;->userWriteResponse:Landroid/util/SparseArray;

    invoke-virtual {v11, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/os/Message;

    .line 1207
    .local v8, response:Landroid/os/Message;
    iget-object v11, p0, Lcom/android/internal/telephony/AdnRecordCache;->userWriteResponse:Landroid/util/SparseArray;

    invoke-virtual {v11, v2}, Landroid/util/SparseArray;->delete(I)V

    .line 1209
    const/4 v11, 0x0

    iget-object v12, v1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-static {v8, v11, v12}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 1210
    invoke-virtual {v8}, Landroid/os/Message;->sendToTarget()V

    goto :goto_0

    .line 1213
    .end local v0           #adn:Lcom/android/internal/telephony/AdnRecord;
    .end local v1           #ar:Landroid/os/AsyncResult;
    .end local v2           #efid:I
    .end local v5           #index:I
    .end local v8           #response:Landroid/os/Message;
    :pswitch_2
    const-string v11, "AdnRecordCache"

    const-string v12, "EVENT_UPDATE_EMAIL_DONE"

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1215
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Landroid/os/AsyncResult;

    .line 1216
    .restart local v1       #ar:Landroid/os/AsyncResult;
    iget v7, p1, Landroid/os/Message;->arg1:I

    .line 1217
    .local v7, recNum:I
    iget v5, p1, Landroid/os/Message;->arg2:I

    .line 1218
    .restart local v5       #index:I
    iget-object v11, v1, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    check-cast v11, Lcom/android/internal/telephony/AdnRecord;

    move-object v0, v11

    check-cast v0, Lcom/android/internal/telephony/AdnRecord;

    .line 1220
    .restart local v0       #adn:Lcom/android/internal/telephony/AdnRecord;
    iget-object v11, v1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-nez v11, :cond_2

    .line 1221
    const/4 v11, 0x1

    iput-boolean v11, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUpdateEmailSuccess:Z

    .line 1222
    iget-object v11, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUsimPhoneBookManager:Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;

    invoke-virtual {v11, v0, v7, v5}, Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;->updateUsimAdnEmail(Lcom/android/internal/telephony/AdnRecord;II)Z

    move-result v11

    iput-boolean v11, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUpdateEmailSuccess:Z

    .line 1227
    :goto_1
    iget-object v12, p0, Lcom/android/internal/telephony/AdnRecordCache;->mLock:Ljava/lang/Object;

    monitor-enter v12

    .line 1228
    :try_start_0
    iget-object v11, p0, Lcom/android/internal/telephony/AdnRecordCache;->mLock:Ljava/lang/Object;

    invoke-virtual {v11}, Ljava/lang/Object;->notify()V

    .line 1229
    monitor-exit v12

    goto/16 :goto_0

    :catchall_0
    move-exception v11

    monitor-exit v12
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v11

    .line 1224
    :cond_2
    const/4 v11, 0x0

    iput-boolean v11, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUpdateEmailSuccess:Z

    goto :goto_1

    .line 1232
    .end local v0           #adn:Lcom/android/internal/telephony/AdnRecord;
    .end local v1           #ar:Landroid/os/AsyncResult;
    .end local v5           #index:I
    .end local v7           #recNum:I
    :pswitch_3
    const-string v11, "AdnRecordCache"

    const-string v12, "EVENT_UPDATE_GRP_DONE"

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1233
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Landroid/os/AsyncResult;

    .line 1234
    .restart local v1       #ar:Landroid/os/AsyncResult;
    iget v7, p1, Landroid/os/Message;->arg1:I

    .line 1235
    .restart local v7       #recNum:I
    iget v5, p1, Landroid/os/Message;->arg2:I

    .line 1236
    .restart local v5       #index:I
    iget-object v11, v1, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    check-cast v11, Lcom/android/internal/telephony/AdnRecord;

    move-object v0, v11

    check-cast v0, Lcom/android/internal/telephony/AdnRecord;

    .line 1238
    .restart local v0       #adn:Lcom/android/internal/telephony/AdnRecord;
    iget-object v11, v1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-nez v11, :cond_3

    .line 1239
    iget-object v11, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUsimPhoneBookManager:Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;

    invoke-virtual {v11, v0, v7, v5}, Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;->updateUsimAdnGrp(Lcom/android/internal/telephony/AdnRecord;II)Z

    move-result v11

    iput-boolean v11, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUpdateGrpSuccess:Z

    .line 1243
    :goto_2
    iget-object v12, p0, Lcom/android/internal/telephony/AdnRecordCache;->mLock:Ljava/lang/Object;

    monitor-enter v12

    .line 1244
    :try_start_1
    iget-object v11, p0, Lcom/android/internal/telephony/AdnRecordCache;->mLock:Ljava/lang/Object;

    invoke-virtual {v11}, Ljava/lang/Object;->notify()V

    .line 1245
    monitor-exit v12

    goto/16 :goto_0

    :catchall_1
    move-exception v11

    monitor-exit v12
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    throw v11

    .line 1241
    :cond_3
    const/4 v11, 0x0

    iput-boolean v11, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUpdateGrpSuccess:Z

    goto :goto_2

    .line 1248
    .end local v0           #adn:Lcom/android/internal/telephony/AdnRecord;
    .end local v1           #ar:Landroid/os/AsyncResult;
    .end local v5           #index:I
    .end local v7           #recNum:I
    :pswitch_4
    const-string v11, "AdnRecordCache"

    const-string v12, "EVENT_UPDATE_GSD_DONE"

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1250
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Landroid/os/AsyncResult;

    .line 1251
    .restart local v1       #ar:Landroid/os/AsyncResult;
    iget v2, p1, Landroid/os/Message;->arg1:I

    .line 1252
    .restart local v2       #efid:I
    iget v3, p1, Landroid/os/Message;->arg2:I

    .line 1253
    .local v3, grpId:I
    iget-object v11, v1, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    check-cast v11, Ljava/lang/String;

    move-object v4, v11

    check-cast v4, Ljava/lang/String;

    .line 1255
    .local v4, grpTag:Ljava/lang/String;
    iget-object v11, v1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-nez v11, :cond_4

    .line 1256
    const/4 v11, 0x1

    iput-boolean v11, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUpdateGsdSuccess:Z

    .line 1261
    :goto_3
    iget-object v11, p0, Lcom/android/internal/telephony/AdnRecordCache;->userWriteResponse:Landroid/util/SparseArray;

    invoke-virtual {v11, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/os/Message;

    .line 1262
    .restart local v8       #response:Landroid/os/Message;
    iget-object v11, p0, Lcom/android/internal/telephony/AdnRecordCache;->userWriteResponse:Landroid/util/SparseArray;

    invoke-virtual {v11, v2}, Landroid/util/SparseArray;->delete(I)V

    .line 1264
    const/4 v11, 0x0

    iget-object v12, v1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-static {v8, v11, v12}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 1265
    invoke-virtual {v8}, Landroid/os/Message;->sendToTarget()V

    .line 1266
    iget-object v12, p0, Lcom/android/internal/telephony/AdnRecordCache;->mLock:Ljava/lang/Object;

    monitor-enter v12

    .line 1267
    :try_start_2
    iget-object v11, p0, Lcom/android/internal/telephony/AdnRecordCache;->mLock:Ljava/lang/Object;

    invoke-virtual {v11}, Ljava/lang/Object;->notify()V

    .line 1268
    monitor-exit v12

    goto/16 :goto_0

    :catchall_2
    move-exception v11

    monitor-exit v12
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    throw v11

    .line 1258
    .end local v8           #response:Landroid/os/Message;
    :cond_4
    const/4 v11, 0x0

    iput-boolean v11, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUpdateGsdSuccess:Z

    goto :goto_3

    .line 1271
    .end local v1           #ar:Landroid/os/AsyncResult;
    .end local v2           #efid:I
    .end local v3           #grpId:I
    .end local v4           #grpTag:Ljava/lang/String;
    :pswitch_5
    const-string v11, "AdnRecordCache"

    const-string v12, "EVENT_UPDATE_ADN_DONE2"

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1273
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Landroid/os/AsyncResult;

    .line 1274
    .restart local v1       #ar:Landroid/os/AsyncResult;
    iget v5, p1, Landroid/os/Message;->arg1:I

    .line 1275
    .restart local v5       #index:I
    iget v6, p1, Landroid/os/Message;->arg2:I

    .line 1276
    .local v6, oldEfid:I
    iget-object v11, v1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v11, Lcom/android/internal/telephony/AdnRecord;

    move-object v0, v11

    check-cast v0, Lcom/android/internal/telephony/AdnRecord;

    .line 1277
    .restart local v0       #adn:Lcom/android/internal/telephony/AdnRecord;
    const-string v11, "AdnRecordCache"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "oldEfid = "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1278
    const/4 v9, 0x0

    .line 1279
    .local v9, updateADN2Success:Z
    iget-object v11, v1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-nez v11, :cond_5

    .line 1280
    const/4 v9, 0x1

    .line 1282
    :cond_5
    const-string v11, "AdnRecordCache"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "mUpdateEmailSuccess = "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-boolean v13, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUpdateEmailSuccess:Z

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1283
    const-string v11, "AdnRecordCache"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "mUpdateAnrSuccess = "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-boolean v13, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUpdateAnrSuccess:Z

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1284
    const-string v11, "AdnRecordCache"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "mUpdateGrpSuccess = "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-boolean v13, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUpdateGrpSuccess:Z

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1285
    const-string v11, "AdnRecordCache"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "mUpdateSneSuccess = "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-boolean v13, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUpdateSneSuccess:Z

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1286
    const-string v11, "AdnRecordCache"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "updateADN2Success = "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1287
    if-eqz v9, :cond_6

    iget-boolean v11, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUpdateEmailSuccess:Z

    if-eqz v11, :cond_6

    iget-boolean v11, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUpdateAnrSuccess:Z

    if-eqz v11, :cond_6

    iget-boolean v11, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUpdateGrpSuccess:Z

    if-eqz v11, :cond_6

    iget-boolean v11, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUpdateSneSuccess:Z

    if-nez v11, :cond_7

    .line 1289
    :cond_6
    new-instance v11, Ljava/lang/Throwable;

    invoke-direct {v11}, Ljava/lang/Throwable;-><init>()V

    iput-object v11, v1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    .line 1291
    :cond_7
    iget-object v11, v1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-nez v11, :cond_8

    .line 1292
    iget-object v11, p0, Lcom/android/internal/telephony/AdnRecordCache;->adnLikeFiles:Landroid/util/SparseArray;

    iget v12, v0, Lcom/android/internal/telephony/AdnRecord;->efid:I

    invoke-virtual {v11, v12}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/ArrayList;

    iget v12, v0, Lcom/android/internal/telephony/AdnRecord;->recordNumber:I

    add-int/lit8 v12, v12, -0x1

    invoke-virtual {v11, v12, v0}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 1293
    const/16 v11, 0x4f30

    if-ne v6, v11, :cond_8

    .line 1294
    iget-object v11, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUsimPhoneBookManager:Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;

    add-int/lit8 v12, v5, -0x1

    invoke-virtual {v11, v12, v0}, Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;->updateUsimAdn(ILcom/android/internal/telephony/AdnRecord;)V

    .line 1297
    :cond_8
    const-string v11, "AdnRecordCache"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "adn = "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1298
    iget-object v11, p0, Lcom/android/internal/telephony/AdnRecordCache;->userWriteResponse:Landroid/util/SparseArray;

    invoke-virtual {v11, v6}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/os/Message;

    .line 1299
    .restart local v8       #response:Landroid/os/Message;
    iget-object v11, p0, Lcom/android/internal/telephony/AdnRecordCache;->userWriteResponse:Landroid/util/SparseArray;

    invoke-virtual {v11, v6}, Landroid/util/SparseArray;->delete(I)V

    .line 1301
    const/4 v11, 0x0

    iget-object v12, v1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-static {v8, v11, v12}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 1302
    invoke-virtual {v8}, Landroid/os/Message;->sendToTarget()V

    goto/16 :goto_0

    .line 1305
    .end local v0           #adn:Lcom/android/internal/telephony/AdnRecord;
    .end local v1           #ar:Landroid/os/AsyncResult;
    .end local v5           #index:I
    .end local v6           #oldEfid:I
    .end local v8           #response:Landroid/os/Message;
    .end local v9           #updateADN2Success:Z
    :pswitch_6
    const-string v11, "AdnRecordCache"

    const-string v12, "EVENT_UPDATE_ANR_DONE"

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1307
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Landroid/os/AsyncResult;

    .line 1308
    .restart local v1       #ar:Landroid/os/AsyncResult;
    iget v7, p1, Landroid/os/Message;->arg1:I

    .line 1309
    .restart local v7       #recNum:I
    iget v5, p1, Landroid/os/Message;->arg2:I

    .line 1310
    .restart local v5       #index:I
    iget-object v11, v1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v11, Lcom/android/internal/telephony/AdnRecord;

    move-object v0, v11

    check-cast v0, Lcom/android/internal/telephony/AdnRecord;

    .line 1311
    .restart local v0       #adn:Lcom/android/internal/telephony/AdnRecord;
    iget-object v11, v1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-nez v11, :cond_9

    .line 1312
    iget-object v11, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUsimPhoneBookManager:Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;

    invoke-virtual {v11, v0, v7, v5}, Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;->updateUsimAdnAnr(Lcom/android/internal/telephony/AdnRecord;II)Z

    move-result v11

    iput-boolean v11, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUpdateAnrSuccess:Z

    .line 1317
    :goto_4
    iget-object v12, p0, Lcom/android/internal/telephony/AdnRecordCache;->mLock:Ljava/lang/Object;

    monitor-enter v12

    .line 1318
    :try_start_3
    iget-object v11, p0, Lcom/android/internal/telephony/AdnRecordCache;->mLock:Ljava/lang/Object;

    invoke-virtual {v11}, Ljava/lang/Object;->notify()V

    .line 1319
    monitor-exit v12

    goto/16 :goto_0

    :catchall_3
    move-exception v11

    monitor-exit v12
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    throw v11

    .line 1314
    :cond_9
    const/4 v11, 0x0

    iput-boolean v11, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUpdateAnrSuccess:Z

    goto :goto_4

    .line 1322
    .end local v0           #adn:Lcom/android/internal/telephony/AdnRecord;
    .end local v1           #ar:Landroid/os/AsyncResult;
    .end local v5           #index:I
    .end local v7           #recNum:I
    :pswitch_7
    const-string v11, "AdnRecordCache"

    const-string v12, "EVENT_UPDATE_SNE_DONE"

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1324
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Landroid/os/AsyncResult;

    .line 1325
    .restart local v1       #ar:Landroid/os/AsyncResult;
    iget v7, p1, Landroid/os/Message;->arg1:I

    .line 1326
    .restart local v7       #recNum:I
    iget v5, p1, Landroid/os/Message;->arg2:I

    .line 1327
    .restart local v5       #index:I
    iget-object v11, v1, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    check-cast v11, Lcom/android/internal/telephony/AdnRecord;

    move-object v0, v11

    check-cast v0, Lcom/android/internal/telephony/AdnRecord;

    .line 1329
    .restart local v0       #adn:Lcom/android/internal/telephony/AdnRecord;
    iget-object v11, v1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-nez v11, :cond_a

    .line 1330
    iget-object v11, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUsimPhoneBookManager:Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;

    invoke-virtual {v11, v0, v7, v5}, Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;->updateUsimAdnSne(Lcom/android/internal/telephony/AdnRecord;II)Z

    move-result v11

    iput-boolean v11, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUpdateSneSuccess:Z

    .line 1334
    :goto_5
    iget-object v12, p0, Lcom/android/internal/telephony/AdnRecordCache;->mLock:Ljava/lang/Object;

    monitor-enter v12

    .line 1335
    :try_start_4
    iget-object v11, p0, Lcom/android/internal/telephony/AdnRecordCache;->mLock:Ljava/lang/Object;

    invoke-virtual {v11}, Ljava/lang/Object;->notify()V

    .line 1336
    monitor-exit v12

    goto/16 :goto_0

    :catchall_4
    move-exception v11

    monitor-exit v12
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    throw v11

    .line 1332
    :cond_a
    const/4 v11, 0x0

    iput-boolean v11, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUpdateSneSuccess:Z

    goto :goto_5

    .line 1180
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_5
        :pswitch_6
        :pswitch_3
        :pswitch_7
        :pswitch_4
    .end packed-switch
.end method

.method public isSimContactsLoaded()Z
    .locals 1

    .prologue
    .line 105
    iget-boolean v0, p0, Lcom/android/internal/telephony/AdnRecordCache;->mSimContactsLoaded:Z

    return v0
.end method

.method public isSneFieldEnable()Z
    .locals 1

    .prologue
    .line 131
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUsimPhoneBookManager:Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;

    if-nez v0, :cond_0

    .line 132
    const/4 v0, 0x0

    .line 133
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUsimPhoneBookManager:Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;

    invoke-virtual {v0}, Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;->isSneFieldEnable()Z

    move-result v0

    goto :goto_0
.end method

.method public requestLoadAllAdnLike(IILandroid/os/Message;)V
    .locals 6
    .parameter "efid"
    .parameter "extensionEf"
    .parameter "response"

    .prologue
    .line 1105
    const/16 v2, 0x4f30

    if-ne p1, v2, :cond_1

    .line 1106
    iget-object v2, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUsimPhoneBookManager:Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;

    invoke-virtual {v2}, Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;->loadEfFilesFromUsim()Ljava/util/ArrayList;

    move-result-object v0

    .line 1112
    .local v0, result:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/internal/telephony/AdnRecord;>;"
    :goto_0
    if-eqz v0, :cond_2

    .line 1113
    if-eqz p3, :cond_0

    .line 1114
    invoke-static {p3}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;)Landroid/os/AsyncResult;

    move-result-object v2

    iput-object v0, v2, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    .line 1115
    invoke-virtual {p3}, Landroid/os/Message;->sendToTarget()V

    .line 1154
    :cond_0
    :goto_1
    return-void

    .line 1108
    .end local v0           #result:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/internal/telephony/AdnRecord;>;"
    :cond_1
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/AdnRecordCache;->getRecordsIfLoaded(I)Ljava/util/ArrayList;

    move-result-object v0

    .restart local v0       #result:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/internal/telephony/AdnRecord;>;"
    goto :goto_0

    .line 1123
    :cond_2
    iget-object v2, p0, Lcom/android/internal/telephony/AdnRecordCache;->adnLikeWaiters:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    .line 1125
    .local v1, waiters:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/os/Message;>;"
    if-eqz v1, :cond_3

    .line 1129
    invoke-virtual {v1, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 1135
    :cond_3
    new-instance v1, Ljava/util/ArrayList;

    .end local v1           #waiters:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/os/Message;>;"
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1136
    .restart local v1       #waiters:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/os/Message;>;"
    invoke-virtual {v1, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1138
    iget-object v2, p0, Lcom/android/internal/telephony/AdnRecordCache;->adnLikeWaiters:Landroid/util/SparseArray;

    invoke-virtual {v2, p1, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 1140
    if-gez p2, :cond_4

    .line 1143
    if-eqz p3, :cond_0

    .line 1144
    invoke-static {p3}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;)Landroid/os/AsyncResult;

    move-result-object v2

    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "EF is not known ADN-like EF:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    iput-object v3, v2, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    .line 1146
    invoke-virtual {p3}, Landroid/os/Message;->sendToTarget()V

    goto :goto_1

    .line 1152
    :cond_4
    new-instance v2, Lcom/android/internal/telephony/AdnRecordLoader;

    iget-object v3, p0, Lcom/android/internal/telephony/AdnRecordCache;->mFh:Lcom/android/internal/telephony/IccFileHandler;

    invoke-direct {v2, v3}, Lcom/android/internal/telephony/AdnRecordLoader;-><init>(Lcom/android/internal/telephony/IccFileHandler;)V

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-virtual {p0, v3, p1, v4}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v3

    invoke-virtual {v2, p1, p2, v3}, Lcom/android/internal/telephony/AdnRecordLoader;->loadAllFromEF(IILandroid/os/Message;)V

    goto :goto_1
.end method

.method public requestLoadUsimGroups(ILandroid/os/Message;)V
    .locals 4
    .parameter "efid"
    .parameter "response"

    .prologue
    .line 1076
    const/16 v1, 0x4f30

    if-ne p1, v1, :cond_1

    .line 1077
    iget-object v1, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUsimPhoneBookManager:Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;->getUsimGroups()Ljava/util/Map;

    move-result-object v0

    .line 1082
    .local v0, result:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/String;>;"
    :goto_0
    if-eqz v0, :cond_2

    .line 1083
    if-eqz p2, :cond_0

    .line 1084
    invoke-static {p2}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;)Landroid/os/AsyncResult;

    move-result-object v1

    iput-object v0, v1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    .line 1085
    invoke-virtual {p2}, Landroid/os/Message;->sendToTarget()V

    .line 1094
    :cond_0
    :goto_1
    return-void

    .line 1079
    .end local v0           #result:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/String;>;"
    :cond_1
    const/4 v0, 0x0

    .restart local v0       #result:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/String;>;"
    goto :goto_0

    .line 1088
    :cond_2
    if-eqz p2, :cond_0

    .line 1089
    invoke-static {p2}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;)Landroid/os/AsyncResult;

    move-result-object v1

    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "Load USIM Groups Fail"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    iput-object v2, v1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    .line 1091
    invoke-virtual {p2}, Landroid/os/Message;->sendToTarget()V

    goto :goto_1
.end method

.method public reset()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 93
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecordCache;->adnLikeFiles:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    .line 94
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUsimPhoneBookManager:Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;

    invoke-virtual {v0}, Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;->reset()V

    .line 95
    sget-object v0, Lcom/android/internal/telephony/AdnRecordCache;->mAdnExt1Map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 97
    invoke-direct {p0}, Lcom/android/internal/telephony/AdnRecordCache;->clearWaiters()V

    .line 98
    invoke-direct {p0}, Lcom/android/internal/telephony/AdnRecordCache;->clearUserWriters()V

    .line 100
    iput v1, p0, Lcom/android/internal/telephony/AdnRecordCache;->PBInitCount:I

    .line 101
    iput-boolean v1, p0, Lcom/android/internal/telephony/AdnRecordCache;->mSimContactsLoaded:Z

    .line 102
    return-void
.end method

.method public setSimContactsLoaded(ZI)V
    .locals 3
    .parameter "loaded"
    .parameter "efid"

    .prologue
    const/4 v2, 0x0

    .line 109
    iput-boolean p1, p0, Lcom/android/internal/telephony/AdnRecordCache;->mSimContactsLoaded:Z

    .line 110
    const/16 v1, 0x4f30

    if-ne p2, v1, :cond_1

    .line 111
    iget-object v1, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUsimPhoneBookManager:Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;->isSimRecordsEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 112
    iput-boolean v2, p0, Lcom/android/internal/telephony/AdnRecordCache;->mSimContactsLoaded:Z

    .line 113
    iput v2, p0, Lcom/android/internal/telephony/AdnRecordCache;->PBInitCount:I

    .line 122
    :cond_0
    :goto_0
    return-void

    .line 116
    :cond_1
    invoke-virtual {p0, p2}, Lcom/android/internal/telephony/AdnRecordCache;->getRecordsIfLoaded(I)Ljava/util/ArrayList;

    move-result-object v0

    .line 117
    .local v0, result:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/internal/telephony/AdnRecord;>;"
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 118
    :cond_2
    iput-boolean v2, p0, Lcom/android/internal/telephony/AdnRecordCache;->mSimContactsLoaded:Z

    .line 119
    iput v2, p0, Lcom/android/internal/telephony/AdnRecordCache;->PBInitCount:I

    goto :goto_0
.end method

.method public updateAdnAnr(Lcom/android/internal/telephony/AdnRecord;IIILjava/lang/String;)V
    .locals 10
    .parameter "adn"
    .parameter "extensionEF"
    .parameter "anrIndex"
    .parameter "recNum"
    .parameter "pin2"

    .prologue
    .line 1020
    const-string v0, "AdnRecordCache"

    const-string v1, "begin updateAdnAnr()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1022
    iget-object v9, p0, Lcom/android/internal/telephony/AdnRecordCache;->mLock:Ljava/lang/Object;

    monitor-enter v9

    .line 1024
    :try_start_0
    invoke-virtual {p1}, Lcom/android/internal/telephony/AdnRecord;->getAnrEfids()[I

    move-result-object v0

    const/4 v1, 0x0

    aget v2, v0, v1

    .line 1025
    .local v2, anrEF:I
    if-ltz v2, :cond_0

    if-gez p2, :cond_1

    .line 1026
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUpdateAnrSuccess:Z

    .line 1027
    monitor-exit v9

    .line 1044
    :goto_0
    return-void

    .line 1029
    :cond_1
    const-string v0, "AdnRecordCache"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "anrEF = "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1030
    const-string v0, "AdnRecordCache"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "extensionEF = "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1031
    const/4 v0, -0x1

    if-eq p3, v0, :cond_2

    if-nez p3, :cond_3

    .line 1032
    :cond_2
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUpdateAnrSuccess:Z

    .line 1033
    monitor-exit v9

    goto :goto_0

    .line 1043
    .end local v2           #anrEF:I
    :catchall_0
    move-exception v0

    monitor-exit v9
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 1036
    .restart local v2       #anrEF:I
    :cond_3
    :try_start_1
    new-instance v0, Lcom/android/internal/telephony/AdnRecordLoader;

    iget-object v1, p0, Lcom/android/internal/telephony/AdnRecordCache;->mFh:Lcom/android/internal/telephony/IccFileHandler;

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/AdnRecordLoader;-><init>(Lcom/android/internal/telephony/IccFileHandler;)V

    iget v5, p1, Lcom/android/internal/telephony/AdnRecord;->recordNumber:I

    const/4 v1, 0x5

    invoke-virtual {p0, v1, p4, p3, p1}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v7

    move-object v1, p1

    move v3, p2

    move v4, p3

    move-object v6, p5

    invoke-virtual/range {v0 .. v7}, Lcom/android/internal/telephony/AdnRecordLoader;->updateAnrEF(Lcom/android/internal/telephony/AdnRecord;IIIILjava/lang/String;Landroid/os/Message;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1039
    :try_start_2
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecordCache;->mLock:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->wait()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    .line 1043
    :goto_1
    :try_start_3
    monitor-exit v9

    goto :goto_0

    .line 1040
    :catch_0
    move-exception v8

    .line 1041
    .local v8, e:Ljava/lang/InterruptedException;
    const-string v0, "AdnRecordCache"

    const-string v1, "Interrupted Exception in updateAdnAnr"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1
.end method

.method public updateAdnByIndex(ILcom/android/internal/telephony/AdnRecord;ILjava/lang/String;Landroid/os/Message;)V
    .locals 8
    .parameter "efid"
    .parameter "adn"
    .parameter "recordIndex"
    .parameter "pin2"
    .parameter "response"

    .prologue
    .line 216
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/AdnRecordCache;->extensionEfForEf(I)I

    move-result v3

    .line 217
    .local v3, extensionEF:I
    if-gez v3, :cond_0

    .line 218
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "EF is not known ADN-like EF:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p5, v0}, Lcom/android/internal/telephony/AdnRecordCache;->sendErrorResponse(Landroid/os/Message;Ljava/lang/String;)V

    .line 233
    :goto_0
    return-void

    .line 222
    :cond_0
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecordCache;->userWriteResponse:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/os/Message;

    .line 223
    .local v7, pendingResponse:Landroid/os/Message;
    if-eqz v7, :cond_1

    .line 224
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Have pending update for EF:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p5, v0}, Lcom/android/internal/telephony/AdnRecordCache;->sendErrorResponse(Landroid/os/Message;Ljava/lang/String;)V

    goto :goto_0

    .line 228
    :cond_1
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecordCache;->userWriteResponse:Landroid/util/SparseArray;

    invoke-virtual {v0, p1, p5}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 230
    new-instance v0, Lcom/android/internal/telephony/AdnRecordLoader;

    iget-object v1, p0, Lcom/android/internal/telephony/AdnRecordCache;->mFh:Lcom/android/internal/telephony/IccFileHandler;

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/AdnRecordLoader;-><init>(Lcom/android/internal/telephony/IccFileHandler;)V

    const/4 v1, 0x2

    invoke-virtual {p0, v1, p1, p3, p2}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v6

    move-object v1, p2

    move v2, p1

    move v4, p3

    move-object v5, p4

    invoke-virtual/range {v0 .. v6}, Lcom/android/internal/telephony/AdnRecordLoader;->updateEF(Lcom/android/internal/telephony/AdnRecord;IIILjava/lang/String;Landroid/os/Message;)V

    goto :goto_0
.end method

.method public updateAdnBySearch(ILcom/android/internal/telephony/AdnRecord;Lcom/android/internal/telephony/AdnRecord;Ljava/lang/String;Landroid/os/Message;)V
    .locals 14
    .parameter "efid"
    .parameter "oldAdn"
    .parameter "newAdn"
    .parameter "pin2"
    .parameter "response"

    .prologue
    .line 253
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/AdnRecordCache;->extensionEfForEf(I)I

    move-result v4

    .line 255
    .local v4, extensionEF:I
    if-gez v4, :cond_0

    .line 256
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "EF is not known ADN-like EF:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    move-object/from16 v0, p5

    invoke-direct {p0, v0, v1}, Lcom/android/internal/telephony/AdnRecordCache;->sendErrorResponse(Landroid/os/Message;Ljava/lang/String;)V

    .line 312
    :goto_0
    return-void

    .line 262
    :cond_0
    const/16 v1, 0x4f30

    if-ne p1, v1, :cond_1

    .line 263
    iget-object v1, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUsimPhoneBookManager:Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;->getUsimPhoneBook()Ljava/util/ArrayList;

    move-result-object v11

    .line 268
    .local v11, oldAdnList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/internal/telephony/AdnRecord;>;"
    :goto_1
    if-nez v11, :cond_2

    .line 269
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Adn list not exist for EF:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    move-object/from16 v0, p5

    invoke-direct {p0, v0, v1}, Lcom/android/internal/telephony/AdnRecordCache;->sendErrorResponse(Landroid/os/Message;Ljava/lang/String;)V

    goto :goto_0

    .line 265
    .end local v11           #oldAdnList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/internal/telephony/AdnRecord;>;"
    :cond_1
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/AdnRecordCache;->getRecordsIfLoaded(I)Ljava/util/ArrayList;

    move-result-object v11

    .restart local v11       #oldAdnList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/internal/telephony/AdnRecord;>;"
    goto :goto_1

    .line 273
    :cond_2
    const/4 v5, -0x1

    .line 274
    .local v5, index:I
    const/4 v8, 0x1

    .line 275
    .local v8, count:I
    invoke-virtual {v11}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, it:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/android/internal/telephony/AdnRecord;>;"
    :goto_2
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 276
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/android/internal/telephony/AdnRecord;

    .line 279
    .local v13, thisRec:Lcom/android/internal/telephony/AdnRecord;
    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lcom/android/internal/telephony/AdnRecord;->isEqual(Lcom/android/internal/telephony/AdnRecord;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 280
    move v5, v8

    .line 286
    .end local v13           #thisRec:Lcom/android/internal/telephony/AdnRecord;
    :cond_3
    const/4 v1, -0x1

    if-ne v5, v1, :cond_5

    .line 287
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Adn record don\'t exist for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move-object/from16 v0, p2

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    move-object/from16 v0, p5

    invoke-direct {p0, v0, v1}, Lcom/android/internal/telephony/AdnRecordCache;->sendErrorResponse(Landroid/os/Message;Ljava/lang/String;)V

    goto :goto_0

    .line 283
    .restart local v13       #thisRec:Lcom/android/internal/telephony/AdnRecord;
    :cond_4
    add-int/lit8 v8, v8, 0x1

    .line 284
    goto :goto_2

    .line 290
    .end local v13           #thisRec:Lcom/android/internal/telephony/AdnRecord;
    :cond_5
    add-int/lit8 v1, v5, -0x1

    invoke-virtual {v11, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/android/internal/telephony/AdnRecord;

    .line 291
    .local v9, foundAdn:Lcom/android/internal/telephony/AdnRecord;
    iget v1, v9, Lcom/android/internal/telephony/AdnRecord;->extRecord:I

    move-object/from16 v0, p3

    iput v1, v0, Lcom/android/internal/telephony/AdnRecord;->extRecord:I

    .line 292
    const/16 v1, 0x4f30

    if-ne p1, v1, :cond_6

    .line 293
    iget p1, v9, Lcom/android/internal/telephony/AdnRecord;->efid:I

    .line 294
    iget v5, v9, Lcom/android/internal/telephony/AdnRecord;->recordNumber:I

    .line 296
    move-object/from16 v0, p3

    iput p1, v0, Lcom/android/internal/telephony/AdnRecord;->efid:I

    .line 297
    move-object/from16 v0, p3

    iput v5, v0, Lcom/android/internal/telephony/AdnRecord;->recordNumber:I

    .line 300
    :cond_6
    iget-object v1, p0, Lcom/android/internal/telephony/AdnRecordCache;->userWriteResponse:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/os/Message;

    .line 302
    .local v12, pendingResponse:Landroid/os/Message;
    if-eqz v12, :cond_7

    .line 303
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Have pending update for EF:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    move-object/from16 v0, p5

    invoke-direct {p0, v0, v1}, Lcom/android/internal/telephony/AdnRecordCache;->sendErrorResponse(Landroid/os/Message;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 307
    :cond_7
    iget-object v1, p0, Lcom/android/internal/telephony/AdnRecordCache;->userWriteResponse:Landroid/util/SparseArray;

    move-object/from16 v0, p5

    invoke-virtual {v1, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 309
    new-instance v1, Lcom/android/internal/telephony/AdnRecordLoader;

    iget-object v2, p0, Lcom/android/internal/telephony/AdnRecordCache;->mFh:Lcom/android/internal/telephony/IccFileHandler;

    invoke-direct {v1, v2}, Lcom/android/internal/telephony/AdnRecordLoader;-><init>(Lcom/android/internal/telephony/IccFileHandler;)V

    const/4 v2, 0x2

    move-object/from16 v0, p3

    invoke-virtual {p0, v2, p1, v5, v0}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v7

    move-object/from16 v2, p3

    move v3, p1

    move-object/from16 v6, p4

    invoke-virtual/range {v1 .. v7}, Lcom/android/internal/telephony/AdnRecordLoader;->updateEF(Lcom/android/internal/telephony/AdnRecord;IIILjava/lang/String;Landroid/os/Message;)V

    goto/16 :goto_0
.end method

.method public updateAdnBySearch2(ILcom/android/internal/telephony/AdnRecord;Lcom/android/internal/telephony/AdnRecord;Ljava/lang/String;Landroid/os/Message;)V
    .locals 42
    .parameter "efid"
    .parameter "oldAdn"
    .parameter "newAdn"
    .parameter "pin2"
    .parameter "response"

    .prologue
    .line 316
    const-string v2, "AdnRecordCache"

    const-string v4, "begin updateAdnBySearch2()"

    invoke-static {v2, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 318
    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/AdnRecordCache;->extensionEfForEf(I)I

    move-result v5

    .line 319
    .local v5, extensionEF:I
    const-string v2, "AdnRecordCache"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "extensionEF = "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 320
    if-gez v5, :cond_0

    .line 321
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "EF is not known ADN-like EF:"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    move-object/from16 v1, p5

    invoke-direct {v0, v1, v2}, Lcom/android/internal/telephony/AdnRecordCache;->sendErrorResponse(Landroid/os/Message;Ljava/lang/String;)V

    .line 667
    :goto_0
    return-void

    .line 325
    :cond_0
    const/4 v9, 0x0

    .line 327
    .local v9, oldAdnList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/internal/telephony/AdnRecord;>;"
    const/16 v2, 0x4f30

    move/from16 v0, p1

    if-ne v0, v2, :cond_2

    .line 328
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecordCache;->mUsimPhoneBookManager:Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;

    invoke-virtual {v2}, Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;->getUsimPhoneBook()Ljava/util/ArrayList;

    move-result-object v9

    .line 333
    :goto_1
    if-eqz v9, :cond_1

    invoke-virtual {v9}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 334
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Adn list not exist for EF:"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    move-object/from16 v1, p5

    invoke-direct {v0, v1, v2}, Lcom/android/internal/telephony/AdnRecordCache;->sendErrorResponse(Landroid/os/Message;Ljava/lang/String;)V

    goto :goto_0

    .line 330
    :cond_2
    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/AdnRecordCache;->getRecordsIfLoaded(I)Ljava/util/ArrayList;

    move-result-object v9

    goto :goto_1

    .line 338
    :cond_3
    const/4 v3, -0x1

    .line 339
    .local v3, index:I
    const/16 v29, 0x1

    .line 340
    .local v29, count:I
    const/16 v16, -0x1

    .line 341
    .local v16, emailIndex:I
    const/16 v17, -0x1

    .line 342
    .local v17, emailIndex2nd:I
    const/4 v6, -0x1

    .line 343
    .local v6, emailEfid2nd:I
    const/16 v18, -0x1

    .line 344
    .local v18, anrIndex:I
    const/16 v20, -0x1

    .line 345
    .local v20, grpIndex:I
    const/16 v19, -0x1

    .line 346
    .local v19, sneIndex:I
    const/4 v10, 0x1

    .line 347
    .local v10, needUpdateEmail:Z
    const/4 v11, 0x1

    .line 348
    .local v11, needUpdateEmail2nd:Z
    const/4 v12, 0x1

    .line 349
    .local v12, needUpdateAnr:Z
    const/4 v14, 0x1

    .line 350
    .local v14, needUpdateGrp:Z
    const/4 v13, 0x1

    .line 351
    .local v13, needUpdateSne:Z
    const/16 v36, 0x0

    .line 352
    .local v36, emailType2Used:Z
    const/4 v15, 0x0

    .line 365
    .local v15, pbrRecordNum:I
    const/16 v2, 0x4f30

    move/from16 v0, p1

    if-ne v0, v2, :cond_37

    .line 366
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v2

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/internal/telephony/AdnRecordCache;->adnLikeFiles:Landroid/util/SparseArray;

    invoke-virtual {v4}, Landroid/util/SparseArray;->size()I

    move-result v4

    div-int v24, v2, v4

    .line 367
    .local v24, adnCountInOneEf:I
    const-string v2, "AdnRecordCache"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "oldAdnList.size() = "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 368
    const-string v2, "AdnRecordCache"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "adnLikeFiles.size() = "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/internal/telephony/AdnRecordCache;->adnLikeFiles:Landroid/util/SparseArray;

    invoke-virtual {v7}, Landroid/util/SparseArray;->size()I

    move-result v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 369
    const-string v2, "AdnRecordCache"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "adnCountInOneEf = "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, v24

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 371
    const/16 v37, 0x0

    .local v37, i:I
    :goto_2
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v2

    move/from16 v0, v37

    if-ge v0, v2, :cond_35

    .line 372
    move/from16 v0, v37

    invoke-virtual {v9, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Lcom/android/internal/telephony/AdnRecord;

    .line 379
    .local v28, comparedAdn:Lcom/android/internal/telephony/AdnRecord;
    move-object/from16 v0, p2

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/AdnRecord;->isEqual(Lcom/android/internal/telephony/AdnRecord;)Z

    move-result v2

    if-eqz v2, :cond_36

    .line 380
    const-string v2, "AdnRecordCache"

    const-string v4, "find an equal ADN"

    invoke-static {v2, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 381
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecordCache;->mUsimPhoneBookManager:Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;

    add-int/lit8 v4, v29, -0x1

    invoke-virtual {v2, v4}, Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;->getpbrRecordNum(I)I

    move-result v15

    .line 383
    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecord;->emailIndexes:[I

    if-nez v2, :cond_7

    .line 384
    const-string v2, "AdnRecordCache"

    const-string v4, "--> 1"

    invoke-static {v2, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 385
    move-object/from16 v0, p3

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    if-eqz v2, :cond_4

    move-object/from16 v0, p3

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    const/4 v4, 0x0

    aget-object v2, v2, v4

    if-eqz v2, :cond_4

    move-object/from16 v0, p3

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    const/4 v4, 0x0

    aget-object v2, v2, v4

    const-string v4, ""

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 386
    :cond_4
    const/4 v10, 0x0

    .line 425
    :cond_5
    :goto_3
    if-eqz v10, :cond_f

    const/4 v2, -0x1

    move/from16 v0, v16

    if-ne v0, v2, :cond_f

    .line 426
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecordCache;->mUsimPhoneBookManager:Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;

    add-int/lit8 v4, v15, 0x1

    invoke-virtual {v2, v4}, Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;->getRecordOffset(I)I

    move-result v2

    add-int/lit8 v37, v2, -0x1

    .line 427
    add-int/lit8 v29, v37, 0x2

    .line 371
    :goto_4
    add-int/lit8 v37, v37, 0x1

    goto :goto_2

    .line 388
    :cond_6
    const/4 v10, 0x1

    .line 389
    const/16 v16, -0x1

    goto :goto_3

    .line 391
    :cond_7
    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecord;->emailIndexes:[I

    const/4 v4, 0x0

    aget v2, v2, v4

    const/4 v4, -0x1

    if-ne v2, v4, :cond_e

    .line 392
    const-string v2, "AdnRecordCache"

    const-string v4, "--> 2"

    invoke-static {v2, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 393
    move-object/from16 v0, p3

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    if-eqz v2, :cond_8

    move-object/from16 v0, p3

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    const/4 v4, 0x0

    aget-object v2, v2, v4

    if-eqz v2, :cond_8

    move-object/from16 v0, p3

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    const/4 v4, 0x0

    aget-object v2, v2, v4

    const-string v4, ""

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 394
    :cond_8
    const-string v2, "AdnRecordCache"

    const-string v4, "--> 3"

    invoke-static {v2, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 395
    const/4 v10, 0x0

    goto :goto_3

    .line 396
    :cond_9
    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecord;->emailFileTypes:[I

    const/4 v4, 0x0

    aget v2, v2, v4

    const/16 v4, 0xa8

    if-ne v2, v4, :cond_b

    .line 397
    const-string v2, "AdnRecordCache"

    const-string v4, "--> 4"

    invoke-static {v2, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 398
    const/4 v10, 0x1

    .line 399
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecordCache;->mUsimPhoneBookManager:Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;

    invoke-virtual {v2, v15}, Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;->getRecordOffset(I)I

    move-result v2

    sub-int v16, v29, v2

    .line 400
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecordCache;->mUsimPhoneBookManager:Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;

    move-object/from16 v0, v28

    iget-object v4, v0, Lcom/android/internal/telephony/AdnRecord;->emailFileTypes:[I

    const/4 v7, 0x0

    aget v4, v4, v7

    move-object/from16 v0, v28

    iget-object v7, v0, Lcom/android/internal/telephony/AdnRecord;->emailEfids:[I

    const/4 v8, 0x0

    aget v7, v7, v8

    invoke-virtual {v2, v4, v15, v7}, Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;->getEmailFileRecords(III)Ljava/util/ArrayList;

    move-result-object v34

    .line 401
    .local v34, emailRecords:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    if-eqz v34, :cond_a

    invoke-virtual/range {v34 .. v34}, Ljava/util/ArrayList;->size()I

    move-result v2

    move/from16 v0, v16

    if-lt v0, v2, :cond_5

    .line 402
    :cond_a
    const/16 v16, -0x1

    goto/16 :goto_3

    .line 405
    .end local v34           #emailRecords:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_b
    const-string v2, "AdnRecordCache"

    const-string v4, "--> 5"

    invoke-static {v2, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 406
    const/4 v10, 0x1

    .line 407
    const/16 v23, 0x1

    .line 408
    .local v23, Recordcount:I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecordCache;->mUsimPhoneBookManager:Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;

    move-object/from16 v0, v28

    iget-object v4, v0, Lcom/android/internal/telephony/AdnRecord;->emailFileTypes:[I

    const/4 v7, 0x0

    aget v4, v4, v7

    move-object/from16 v0, v28

    iget-object v7, v0, Lcom/android/internal/telephony/AdnRecord;->emailEfids:[I

    const/4 v8, 0x0

    aget v7, v7, v8

    invoke-virtual {v2, v4, v15, v7}, Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;->getEmailFileRecords(III)Ljava/util/ArrayList;

    move-result-object v34

    .line 409
    .restart local v34       #emailRecords:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecordCache;->mUsimPhoneBookManager:Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;

    move-object/from16 v0, v28

    iget-object v4, v0, Lcom/android/internal/telephony/AdnRecord;->emailFileTypes:[I

    const/4 v7, 0x0

    aget v4, v4, v7

    move-object/from16 v0, v28

    iget-object v7, v0, Lcom/android/internal/telephony/AdnRecord;->emailEfids:[I

    const/4 v8, 0x0

    aget v7, v7, v8

    invoke-virtual {v2, v4, v15, v7}, Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;->getEmailFileRecordsUsed(III)Ljava/util/ArrayList;

    move-result-object v35

    .line 410
    .local v35, emailRecordsUsed:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    const-string v2, "Chris"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "emailRecordsUsed = "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v35

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 411
    invoke-virtual/range {v34 .. v34}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v33

    .local v33, emailIt:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_5
    invoke-interface/range {v33 .. v33}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 412
    invoke-interface/range {v33 .. v33}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v31

    check-cast v31, Ljava/lang/String;

    .line 413
    .local v31, email:Ljava/lang/String;
    if-eqz v31, :cond_c

    const-string v2, ""

    move-object/from16 v0, v31

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_c

    add-int/lit8 v2, v23, -0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    move-object/from16 v0, v35

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_d

    .line 414
    :cond_c
    move/from16 v16, v23

    .line 415
    const/16 v36, 0x1

    .line 416
    goto/16 :goto_3

    .line 418
    :cond_d
    add-int/lit8 v23, v23, 0x1

    .line 419
    goto :goto_5

    .line 422
    .end local v23           #Recordcount:I
    .end local v31           #email:Ljava/lang/String;
    .end local v33           #emailIt:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v34           #emailRecords:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v35           #emailRecordsUsed:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    :cond_e
    const-string v2, "AdnRecordCache"

    const-string v4, "--> 6"

    invoke-static {v2, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 423
    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecord;->emailIndexes:[I

    const/4 v4, 0x0

    aget v16, v2, v4

    goto/16 :goto_3

    .line 431
    :cond_f
    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/telephony/AdnRecordCache;->getEmailFieldSize()I

    move-result v2

    const/4 v4, 0x1

    if-le v2, v4, :cond_26

    .line 432
    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecord;->emailIndexes:[I

    if-nez v2, :cond_13

    .line 433
    const-string v2, "AdnRecordCache"

    const-string v4, "-->2nd 1"

    invoke-static {v2, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 434
    move-object/from16 v0, p3

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    if-eqz v2, :cond_10

    move-object/from16 v0, p3

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    array-length v2, v2

    const/4 v4, 0x1

    if-le v2, v4, :cond_10

    move-object/from16 v0, p3

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    const/4 v4, 0x1

    aget-object v2, v2, v4

    const-string v4, ""

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_12

    .line 435
    :cond_10
    const/4 v11, 0x0

    .line 513
    :cond_11
    :goto_6
    if-eqz v11, :cond_27

    const/4 v2, -0x1

    move/from16 v0, v17

    if-ne v0, v2, :cond_27

    .line 514
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecordCache;->mUsimPhoneBookManager:Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;

    add-int/lit8 v4, v15, 0x1

    invoke-virtual {v2, v4}, Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;->getRecordOffset(I)I

    move-result v2

    add-int/lit8 v37, v2, -0x1

    .line 515
    add-int/lit8 v29, v37, 0x2

    .line 516
    goto/16 :goto_4

    .line 437
    :cond_12
    const/4 v11, 0x1

    .line 438
    const/16 v17, -0x1

    goto :goto_6

    .line 440
    :cond_13
    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecord;->emailIndexes:[I

    array-length v2, v2

    const/4 v4, 0x1

    if-le v2, v4, :cond_1c

    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecord;->emailIndexes:[I

    const/4 v4, 0x1

    aget v2, v2, v4

    const/4 v4, -0x1

    if-ne v2, v4, :cond_1c

    .line 441
    const-string v2, "AdnRecordCache"

    const-string v4, "-->2nd 2"

    invoke-static {v2, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 442
    move-object/from16 v0, p3

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    if-eqz v2, :cond_14

    move-object/from16 v0, p3

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    array-length v2, v2

    const/4 v4, 0x1

    if-le v2, v4, :cond_14

    move-object/from16 v0, p3

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    const/4 v4, 0x1

    aget-object v2, v2, v4

    const-string v4, ""

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_16

    .line 443
    :cond_14
    const-string v2, "AdnRecordCache"

    const-string v4, "-->2nd 3"

    invoke-static {v2, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 444
    const/4 v11, 0x0

    .line 470
    :cond_15
    :goto_7
    if-eqz v10, :cond_11

    if-eqz v11, :cond_11

    .line 471
    add-int/lit8 v17, v17, 0x1

    goto :goto_6

    .line 445
    :cond_16
    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecord;->emailFileTypes:[I

    const/4 v4, 0x1

    aget v2, v2, v4

    const/16 v4, 0xa8

    if-ne v2, v4, :cond_18

    .line 446
    const-string v2, "AdnRecordCache"

    const-string v4, "-->2nd 4"

    invoke-static {v2, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 447
    const/4 v11, 0x1

    .line 448
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecordCache;->mUsimPhoneBookManager:Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;

    invoke-virtual {v2, v15}, Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;->getRecordOffset(I)I

    move-result v2

    sub-int v17, v29, v2

    .line 449
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecordCache;->mUsimPhoneBookManager:Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;

    move-object/from16 v0, v28

    iget-object v4, v0, Lcom/android/internal/telephony/AdnRecord;->emailFileTypes:[I

    const/4 v7, 0x1

    aget v4, v4, v7

    move-object/from16 v0, v28

    iget-object v7, v0, Lcom/android/internal/telephony/AdnRecord;->emailEfids:[I

    const/4 v8, 0x1

    aget v7, v7, v8

    invoke-virtual {v2, v4, v15, v7}, Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;->getEmailFileRecords(III)Ljava/util/ArrayList;

    move-result-object v34

    .line 450
    .restart local v34       #emailRecords:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    if-eqz v34, :cond_17

    invoke-virtual/range {v34 .. v34}, Ljava/util/ArrayList;->size()I

    move-result v2

    move/from16 v0, v17

    if-lt v0, v2, :cond_15

    .line 451
    :cond_17
    const/16 v17, -0x1

    goto :goto_7

    .line 453
    .end local v34           #emailRecords:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_18
    if-nez v36, :cond_1b

    .line 454
    const-string v2, "AdnRecordCache"

    const-string v4, "-->2nd 5"

    invoke-static {v2, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 455
    const/4 v11, 0x1

    .line 456
    const/16 v23, 0x1

    .line 457
    .restart local v23       #Recordcount:I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecordCache;->mUsimPhoneBookManager:Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;

    move-object/from16 v0, v28

    iget-object v4, v0, Lcom/android/internal/telephony/AdnRecord;->emailFileTypes:[I

    const/4 v7, 0x1

    aget v4, v4, v7

    move-object/from16 v0, v28

    iget-object v7, v0, Lcom/android/internal/telephony/AdnRecord;->emailEfids:[I

    const/4 v8, 0x1

    aget v7, v7, v8

    invoke-virtual {v2, v4, v15, v7}, Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;->getEmailFileRecords(III)Ljava/util/ArrayList;

    move-result-object v34

    .line 458
    .restart local v34       #emailRecords:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual/range {v34 .. v34}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v33

    .restart local v33       #emailIt:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_8
    invoke-interface/range {v33 .. v33}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_15

    .line 459
    invoke-interface/range {v33 .. v33}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v31

    check-cast v31, Ljava/lang/String;

    .line 460
    .restart local v31       #email:Ljava/lang/String;
    if-eqz v31, :cond_19

    const-string v2, ""

    move-object/from16 v0, v31

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1a

    .line 461
    :cond_19
    move/from16 v17, v23

    .line 462
    const/16 v36, 0x1

    .line 463
    goto/16 :goto_7

    .line 465
    :cond_1a
    add-int/lit8 v23, v23, 0x1

    .line 466
    goto :goto_8

    .line 467
    .end local v23           #Recordcount:I
    .end local v31           #email:Ljava/lang/String;
    .end local v33           #emailIt:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v34           #emailRecords:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_1b
    if-eqz v36, :cond_15

    .line 468
    const/4 v11, 0x0

    goto/16 :goto_7

    .line 473
    :cond_1c
    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecord;->emailIndexes:[I

    array-length v2, v2

    const/4 v4, 0x1

    if-le v2, v4, :cond_1d

    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecord;->emailIndexes:[I

    const/4 v4, 0x1

    aget v2, v2, v4

    const/4 v4, -0x1

    if-eq v2, v4, :cond_1d

    .line 474
    const-string v2, "AdnRecordCache"

    const-string v4, "-->2nd 6"

    invoke-static {v2, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 475
    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecord;->emailIndexes:[I

    const/4 v4, 0x1

    aget v17, v2, v4

    goto/16 :goto_6

    .line 476
    :cond_1d
    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecord;->emailIndexes:[I

    array-length v2, v2

    const/4 v4, 0x1

    if-gt v2, v4, :cond_11

    move-object/from16 v0, p3

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    if-eqz v2, :cond_11

    .line 477
    move-object/from16 v0, p3

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    array-length v2, v2

    const/4 v4, 0x1

    if-le v2, v4, :cond_1e

    move-object/from16 v0, p3

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    const/4 v4, 0x1

    aget-object v2, v2, v4

    if-eqz v2, :cond_1e

    move-object/from16 v0, p3

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    const/4 v4, 0x1

    aget-object v2, v2, v4

    const-string v4, ""

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_20

    .line 478
    :cond_1e
    const-string v2, "AdnRecordCache"

    const-string v4, "-->2nd 7"

    invoke-static {v2, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 479
    const/4 v11, 0x0

    .line 506
    :cond_1f
    :goto_9
    if-eqz v10, :cond_11

    if-eqz v11, :cond_11

    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecord;->emailEfids:[I

    const/4 v4, 0x0

    aget v2, v2, v4

    if-ne v6, v2, :cond_11

    const/4 v2, -0x1

    move/from16 v0, v17

    if-eq v0, v2, :cond_11

    .line 507
    add-int/lit8 v17, v17, 0x1

    goto/16 :goto_6

    .line 480
    :cond_20
    if-nez v36, :cond_25

    .line 481
    const-string v2, "AdnRecordCache"

    const-string v4, "-->2nd 8"

    invoke-static {v2, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 482
    const/4 v11, 0x1

    .line 483
    const/16 v23, 0x1

    .line 484
    .restart local v23       #Recordcount:I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecordCache;->mUsimPhoneBookManager:Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;

    invoke-virtual {v2}, Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;->getPbrFileSize()I

    move-result v41

    .line 485
    .local v41, pbrFileSize:I
    const/16 v40, 0x0

    .local v40, num:I
    :goto_a
    move/from16 v0, v40

    move/from16 v1, v41

    if-ge v0, v1, :cond_1f

    .line 486
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecordCache;->mUsimPhoneBookManager:Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;

    move/from16 v0, v40

    invoke-virtual {v2, v0}, Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;->getEmailType2Files(I)Ljava/util/Set;

    move-result-object v32

    .line 487
    .local v32, emailFiles:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/Integer;>;"
    invoke-interface/range {v32 .. v32}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v39

    .line 488
    .local v39, iterEmailFiles:Ljava/util/Iterator;
    :cond_21
    :goto_b
    invoke-interface/range {v39 .. v39}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_24

    .line 489
    invoke-interface/range {v39 .. v39}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v30

    .line 490
    .local v30, ef:I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecordCache;->mUsimPhoneBookManager:Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/internal/telephony/AdnRecordCache;->mUsimPhoneBookManager:Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;

    const/16 v4, 0xa9

    move/from16 v0, v40

    move/from16 v1, v30

    invoke-virtual {v2, v4, v0, v1}, Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;->getEmailFileRecords(III)Ljava/util/ArrayList;

    move-result-object v34

    .line 491
    .restart local v34       #emailRecords:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual/range {v34 .. v34}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v33

    .restart local v33       #emailIt:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_c
    invoke-interface/range {v33 .. v33}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_21

    .line 492
    invoke-interface/range {v33 .. v33}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v31

    check-cast v31, Ljava/lang/String;

    .line 493
    .restart local v31       #email:Ljava/lang/String;
    if-eqz v31, :cond_22

    const-string v2, ""

    move-object/from16 v0, v31

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_23

    .line 494
    :cond_22
    move/from16 v6, v30

    .line 495
    move/from16 v17, v23

    .line 496
    const/16 v36, 0x1

    .line 497
    goto :goto_b

    .line 499
    :cond_23
    add-int/lit8 v23, v23, 0x1

    .line 500
    goto :goto_c

    .line 485
    .end local v30           #ef:I
    .end local v31           #email:Ljava/lang/String;
    .end local v33           #emailIt:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v34           #emailRecords:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_24
    add-int/lit8 v40, v40, 0x1

    goto :goto_a

    .line 503
    .end local v23           #Recordcount:I
    .end local v32           #emailFiles:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/Integer;>;"
    .end local v39           #iterEmailFiles:Ljava/util/Iterator;
    .end local v40           #num:I
    .end local v41           #pbrFileSize:I
    :cond_25
    if-eqz v36, :cond_1f

    .line 504
    const/4 v11, 0x0

    goto/16 :goto_9

    .line 511
    :cond_26
    const/4 v11, 0x0

    goto/16 :goto_6

    .line 519
    :cond_27
    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecord;->anrIndexes:[I

    if-nez v2, :cond_2b

    .line 520
    const-string v2, "AdnRecordCache"

    const-string v4, "anr --> 1"

    invoke-static {v2, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 521
    move-object/from16 v0, p3

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecord;->anrs:[Ljava/lang/String;

    if-eqz v2, :cond_28

    move-object/from16 v0, p3

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecord;->anrs:[Ljava/lang/String;

    const/4 v4, 0x0

    aget-object v2, v2, v4

    if-eqz v2, :cond_28

    move-object/from16 v0, p3

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecord;->anrs:[Ljava/lang/String;

    const/4 v4, 0x0

    aget-object v2, v2, v4

    const-string v4, ""

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2a

    .line 522
    :cond_28
    const/4 v12, 0x0

    .line 565
    :cond_29
    :goto_d
    if-eqz v12, :cond_34

    const/4 v2, -0x1

    move/from16 v0, v18

    if-ne v0, v2, :cond_34

    .line 566
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecordCache;->mUsimPhoneBookManager:Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;

    add-int/lit8 v4, v15, 0x1

    invoke-virtual {v2, v4}, Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;->getRecordOffset(I)I

    move-result v2

    add-int/lit8 v37, v2, -0x1

    .line 567
    add-int/lit8 v29, v37, 0x2

    .line 568
    goto/16 :goto_4

    .line 524
    :cond_2a
    const/4 v12, 0x1

    .line 525
    const/16 v18, -0x1

    goto :goto_d

    .line 527
    :cond_2b
    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecord;->anrIndexes:[I

    const/4 v4, 0x0

    aget v2, v2, v4

    const/4 v4, -0x1

    if-ne v2, v4, :cond_32

    .line 528
    const-string v2, "AdnRecordCache"

    const-string v4, "anr --> 2"

    invoke-static {v2, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 529
    move-object/from16 v0, p3

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecord;->anrs:[Ljava/lang/String;

    if-eqz v2, :cond_2c

    move-object/from16 v0, p3

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecord;->anrs:[Ljava/lang/String;

    const/4 v4, 0x0

    aget-object v2, v2, v4

    if-eqz v2, :cond_2c

    move-object/from16 v0, p3

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecord;->anrs:[Ljava/lang/String;

    const/4 v4, 0x0

    aget-object v2, v2, v4

    const-string v4, ""

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2d

    .line 531
    :cond_2c
    const-string v2, "AdnRecordCache"

    const-string v4, "anr --> 3"

    invoke-static {v2, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 532
    const/4 v12, 0x0

    goto :goto_d

    .line 533
    :cond_2d
    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecord;->anrFileTypes:[I

    const/4 v4, 0x0

    aget v2, v2, v4

    const/16 v4, 0xa8

    if-ne v2, v4, :cond_2f

    .line 534
    const-string v2, "AdnRecordCache"

    const-string v4, "anr --> 4"

    invoke-static {v2, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 535
    const/4 v12, 0x1

    .line 536
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecordCache;->mUsimPhoneBookManager:Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;

    invoke-virtual {v2, v15}, Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;->getRecordOffset(I)I

    move-result v2

    sub-int v18, v29, v2

    .line 537
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecordCache;->mUsimPhoneBookManager:Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;

    move-object/from16 v0, v28

    iget-object v4, v0, Lcom/android/internal/telephony/AdnRecord;->anrFileTypes:[I

    const/4 v7, 0x0

    aget v4, v4, v7

    move-object/from16 v0, v28

    iget-object v7, v0, Lcom/android/internal/telephony/AdnRecord;->anrEfids:[I

    const/4 v8, 0x0

    aget v7, v7, v8

    invoke-virtual {v2, v4, v15, v7}, Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;->getAnrFileRecords(III)Ljava/util/ArrayList;

    move-result-object v27

    .line 538
    .local v27, anrRecords:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    if-eqz v27, :cond_2e

    invoke-virtual/range {v27 .. v27}, Ljava/util/ArrayList;->size()I

    move-result v2

    move/from16 v0, v18

    if-lt v0, v2, :cond_29

    .line 539
    :cond_2e
    const/16 v18, -0x1

    goto/16 :goto_d

    .line 542
    .end local v27           #anrRecords:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_2f
    const-string v2, "AdnRecordCache"

    const-string v4, "anr --> 5"

    invoke-static {v2, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 543
    const/4 v12, 0x1

    .line 544
    const/16 v23, 0x1

    .line 545
    .restart local v23       #Recordcount:I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecordCache;->mUsimPhoneBookManager:Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;

    move-object/from16 v0, v28

    iget-object v4, v0, Lcom/android/internal/telephony/AdnRecord;->anrFileTypes:[I

    const/4 v7, 0x0

    aget v4, v4, v7

    move-object/from16 v0, v28

    iget-object v7, v0, Lcom/android/internal/telephony/AdnRecord;->anrEfids:[I

    const/4 v8, 0x0

    aget v7, v7, v8

    invoke-virtual {v2, v4, v15, v7}, Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;->getAnrFileRecords(III)Ljava/util/ArrayList;

    move-result-object v27

    .line 548
    .restart local v27       #anrRecords:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual/range {v27 .. v27}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v26

    .local v26, anrIt:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_e
    invoke-interface/range {v26 .. v26}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_29

    .line 549
    invoke-interface/range {v26 .. v26}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Ljava/lang/String;

    .line 550
    .local v25, anr:Ljava/lang/String;
    if-eqz v25, :cond_30

    const-string v2, ""

    move-object/from16 v0, v25

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_31

    .line 551
    :cond_30
    move/from16 v18, v23

    .line 552
    goto/16 :goto_d

    .line 554
    :cond_31
    add-int/lit8 v23, v23, 0x1

    .line 555
    goto :goto_e

    .line 558
    .end local v23           #Recordcount:I
    .end local v25           #anr:Ljava/lang/String;
    .end local v26           #anrIt:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v27           #anrRecords:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_32
    const-string v2, "AdnRecordCache"

    const-string v4, "anr --> 6"

    invoke-static {v2, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 559
    move-object/from16 v0, p3

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecord;->anrs:[Ljava/lang/String;

    if-eqz v2, :cond_33

    move-object/from16 v0, p3

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecord;->anrs:[Ljava/lang/String;

    const/4 v4, 0x0

    aget-object v2, v2, v4

    if-eqz v2, :cond_33

    move-object/from16 v0, p3

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecord;->anrs:[Ljava/lang/String;

    const/4 v4, 0x0

    aget-object v2, v2, v4

    move-object/from16 v0, v28

    iget-object v4, v0, Lcom/android/internal/telephony/AdnRecord;->anrs:[Ljava/lang/String;

    const/4 v7, 0x0

    aget-object v4, v4, v7

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_33

    .line 561
    const/4 v12, 0x0

    .line 563
    :cond_33
    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/android/internal/telephony/AdnRecord;->anrIndexes:[I

    const/4 v4, 0x0

    aget v18, v2, v4

    goto/16 :goto_d

    .line 572
    :cond_34
    const/4 v13, 0x0

    .line 573
    const/4 v14, 0x0

    .line 630
    move/from16 v3, v29

    .line 645
    .end local v24           #adnCountInOneEf:I
    .end local v28           #comparedAdn:Lcom/android/internal/telephony/AdnRecord;
    .end local v37           #i:I
    :cond_35
    :goto_f
    const-string v2, "AdnRecordCache"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "in updateAdnBySearch2()  index: "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v7, " emailIndex: "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, v16

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 646
    const-string v2, "AdnRecordCache"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "in updateAdnBySearch2()  needUpdateEmail: "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 647
    const-string v2, "AdnRecordCache"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "in updateAdnBySearch2()  index: "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v7, " emailIndex2nd: "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 648
    const-string v2, "AdnRecordCache"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "in updateAdnBySearch2()  needUpdateEmail2nd: "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 649
    const-string v2, "AdnRecordCache"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "in updateAdnBySearch2()  index: "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v7, " anrIndex: "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, v18

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 650
    const-string v2, "AdnRecordCache"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "in updateAdnBySearch2()  needUpdateAnr: "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 651
    const-string v2, "AdnRecordCache"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "in updateAdnBySearch2()  index: "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v7, " sneIndex: "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 652
    const-string v2, "AdnRecordCache"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "in updateAdnBySearch2()  needUpdateSne: "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v13}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 653
    const-string v2, "AdnRecordCache"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "in updateAdnBySearch2()  index: "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v7, " grpIndex: "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, v20

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 654
    const-string v2, "AdnRecordCache"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "in updateAdnBySearch2()  needUpdateGrp: "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 655
    const/4 v2, -0x1

    if-ne v3, v2, :cond_39

    .line 656
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Adn record don\'t exist for "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    move-object/from16 v1, p5

    invoke-direct {v0, v1, v2}, Lcom/android/internal/telephony/AdnRecordCache;->sendErrorResponse(Landroid/os/Message;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 633
    .restart local v24       #adnCountInOneEf:I
    .restart local v28       #comparedAdn:Lcom/android/internal/telephony/AdnRecord;
    .restart local v37       #i:I
    :cond_36
    add-int/lit8 v29, v29, 0x1

    goto/16 :goto_4

    .line 636
    .end local v24           #adnCountInOneEf:I
    .end local v28           #comparedAdn:Lcom/android/internal/telephony/AdnRecord;
    .end local v37           #i:I
    :cond_37
    invoke-virtual {v9}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v38

    .local v38, it:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/android/internal/telephony/AdnRecord;>;"
    :goto_10
    invoke-interface/range {v38 .. v38}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_35

    .line 637
    invoke-interface/range {v38 .. v38}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/internal/telephony/AdnRecord;

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Lcom/android/internal/telephony/AdnRecord;->isEqual(Lcom/android/internal/telephony/AdnRecord;)Z

    move-result v2

    if-eqz v2, :cond_38

    .line 638
    move/from16 v3, v29

    .line 639
    goto/16 :goto_f

    .line 641
    :cond_38
    add-int/lit8 v29, v29, 0x1

    goto :goto_10

    .end local v38           #it:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/android/internal/telephony/AdnRecord;>;"
    :cond_39
    move-object/from16 v2, p0

    move/from16 v4, p1

    move-object/from16 v7, p2

    move-object/from16 v8, p3

    move-object/from16 v21, p4

    move-object/from16 v22, p5

    .line 660
    invoke-direct/range {v2 .. v22}, Lcom/android/internal/telephony/AdnRecordCache;->updateEfByIndexes(IIIILcom/android/internal/telephony/AdnRecord;Lcom/android/internal/telephony/AdnRecord;Ljava/util/ArrayList;ZZZZZIIIIIILjava/lang/String;Landroid/os/Message;)V

    goto/16 :goto_0
.end method

.method public updateAdnGrpBySearch(ILcom/android/internal/telephony/AdnRecord;Ljava/lang/String;[BLandroid/os/Message;)V
    .locals 18
    .parameter "efid"
    .parameter "oldAdn"
    .parameter "pin2"
    .parameter "addgrp"
    .parameter "response"

    .prologue
    .line 825
    const-string v15, "AdnRecordCache"

    const-string v16, "begin updateAdnGrpBySearch()"

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 827
    const/4 v11, 0x0

    .line 829
    .local v11, oldAdnList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/internal/telephony/AdnRecord;>;"
    const/16 v15, 0x4f30

    move/from16 v0, p1

    if-ne v0, v15, :cond_0

    .line 830
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/internal/telephony/AdnRecordCache;->mUsimPhoneBookManager:Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;

    invoke-virtual {v15}, Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;->getUsimPhoneBook()Ljava/util/ArrayList;

    move-result-object v11

    .line 835
    if-nez v11, :cond_1

    .line 836
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Adn list not exist for EF:"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move/from16 v0, p1

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    move-object/from16 v0, p0

    move-object/from16 v1, p5

    invoke-direct {v0, v1, v15}, Lcom/android/internal/telephony/AdnRecordCache;->sendErrorResponse(Landroid/os/Message;Ljava/lang/String;)V

    .line 906
    :cond_0
    :goto_0
    return-void

    .line 840
    :cond_1
    const/4 v8, -0x1

    .line 841
    .local v8, index:I
    const/4 v4, 0x1

    .line 842
    .local v4, count:I
    const/4 v7, -0x1

    .line 843
    .local v7, grpIndex:I
    const/4 v10, 0x0

    .line 844
    .local v10, needUpdateGrp:Z
    const/4 v13, 0x0

    .line 855
    .local v13, pbrRecordNum:I
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/AdnRecordCache;->adnLikeFiles:Landroid/util/SparseArray;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Landroid/util/SparseArray;->size()I

    move-result v16

    div-int v2, v15, v16

    .line 856
    .local v2, adnCountInOneEf:I
    const-string v15, "AdnRecordCache"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "oldAdnList.size() = "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 857
    const-string v15, "AdnRecordCache"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "adnLikeFiles.size() = "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/AdnRecordCache;->adnLikeFiles:Landroid/util/SparseArray;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/util/SparseArray;->size()I

    move-result v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 858
    const-string v15, "AdnRecordCache"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "adnCountInOneEf = "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 860
    invoke-virtual {v11}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, it:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/android/internal/telephony/AdnRecord;>;"
    :goto_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_2

    .line 861
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/internal/telephony/AdnRecord;

    .line 864
    .local v3, comparedAdn:Lcom/android/internal/telephony/AdnRecord;
    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lcom/android/internal/telephony/AdnRecord;->isEqual(Lcom/android/internal/telephony/AdnRecord;)Z

    move-result v15

    if-eqz v15, :cond_5

    .line 865
    const-string v15, "AdnRecordCache"

    const-string v16, "oldAdn.isEqual(comparedAdn) "

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 866
    add-int/lit8 v15, v4, -0x1

    div-int v13, v15, v2

    .line 867
    iget v15, v3, Lcom/android/internal/telephony/AdnRecord;->grpEfid:I

    const/16 v16, -0x1

    move/from16 v0, v16

    if-ne v15, v0, :cond_4

    .line 872
    :goto_2
    move v8, v4

    .line 878
    .end local v3           #comparedAdn:Lcom/android/internal/telephony/AdnRecord;
    :cond_2
    const-string v15, "AdnRecordCache"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "in updateAdnGrpBySearch()  index: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, ", grpIndex: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 879
    const-string v15, "AdnRecordCache"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "in updateAdnGrpBySearch()  needUpdateGrp: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 881
    if-eqz v10, :cond_3

    const/4 v15, -0x1

    if-ne v8, v15, :cond_6

    .line 882
    :cond_3
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Adn record don\'t exist for "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p2

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    move-object/from16 v0, p0

    move-object/from16 v1, p5

    invoke-direct {v0, v1, v15}, Lcom/android/internal/telephony/AdnRecordCache;->sendErrorResponse(Landroid/os/Message;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 869
    .restart local v3       #comparedAdn:Lcom/android/internal/telephony/AdnRecord;
    :cond_4
    const/4 v10, 0x1

    .line 870
    mul-int v15, v13, v2

    sub-int v7, v4, v15

    goto :goto_2

    .line 875
    :cond_5
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_1

    .line 886
    .end local v3           #comparedAdn:Lcom/android/internal/telephony/AdnRecord;
    :cond_6
    move v12, v8

    .line 888
    .local v12, oldIndex:I
    const/4 v5, 0x0

    .line 890
    .local v5, foundAdn:Lcom/android/internal/telephony/AdnRecord;
    add-int/lit8 v15, v8, -0x1

    invoke-virtual {v11, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    .end local v5           #foundAdn:Lcom/android/internal/telephony/AdnRecord;
    check-cast v5, Lcom/android/internal/telephony/AdnRecord;

    .line 892
    .restart local v5       #foundAdn:Lcom/android/internal/telephony/AdnRecord;
    iget v6, v5, Lcom/android/internal/telephony/AdnRecord;->grpEfid:I

    .line 893
    .local v6, grpEfid:I
    iget v8, v5, Lcom/android/internal/telephony/AdnRecord;->recordNumber:I

    .line 894
    const/4 v15, 0x0

    new-array v15, v15, [B

    iput-object v15, v5, Lcom/android/internal/telephony/AdnRecord;->grps:[B

    .line 896
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/internal/telephony/AdnRecordCache;->userWriteResponse:Landroid/util/SparseArray;

    move/from16 v0, p1

    invoke-virtual {v15, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroid/os/Message;

    .line 898
    .local v14, pendingResponse:Landroid/os/Message;
    if-eqz v14, :cond_7

    .line 899
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Have pending update for EF:"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move/from16 v0, p1

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    move-object/from16 v0, p0

    move-object/from16 v1, p5

    invoke-direct {v0, v1, v15}, Lcom/android/internal/telephony/AdnRecordCache;->sendErrorResponse(Landroid/os/Message;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 903
    :cond_7
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/internal/telephony/AdnRecordCache;->userWriteResponse:Landroid/util/SparseArray;

    move/from16 v0, p1

    move-object/from16 v1, p5

    invoke-virtual {v15, v0, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 905
    iget v15, v5, Lcom/android/internal/telephony/AdnRecord;->recordNumber:I

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v5, v15, v13, v1}, Lcom/android/internal/telephony/AdnRecordCache;->updateAdnGrp(Lcom/android/internal/telephony/AdnRecord;IILjava/lang/String;)V

    goto/16 :goto_0
.end method

.method public updateAdnGrpTagByIndex(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V
    .locals 8
    .parameter "efid"
    .parameter "grpId"
    .parameter "grpTag"
    .parameter "pin2"
    .parameter "response"

    .prologue
    const/4 v7, -0x1

    .line 910
    const-string v4, "AdnRecordCache"

    const-string v5, "begin updateAdnGrpTagByIndex()"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 912
    const/4 v2, 0x0

    .line 913
    .local v2, oldAdnList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/internal/telephony/AdnRecord;>;"
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 914
    .local v1, index:I
    const/4 v0, -0x1

    .line 915
    .local v0, gsdEf:I
    iget-object v4, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUsimPhoneBookManager:Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;

    invoke-virtual {v4, v1}, Lcom/android/internal/telephony/gsm/UsimPhoneBookManager;->getGsdEf(I)I

    move-result v0

    .line 917
    if-ne v0, v7, :cond_0

    .line 918
    const-string v4, "GSD Ef not exist"

    invoke-direct {p0, p5, v4}, Lcom/android/internal/telephony/AdnRecordCache;->sendErrorResponse(Landroid/os/Message;Ljava/lang/String;)V

    .line 940
    :goto_0
    return-void

    .line 922
    :cond_0
    const-string v4, "AdnRecordCache"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "in updateAdnGrpTagByIndex()  grpId: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 923
    const-string v4, "AdnRecordCache"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "in updateAdnGrpTagByIndex()  grpTag: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 924
    const-string v4, "AdnRecordCache"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "in updateAdnGrpTagByIndex()  gsdEf: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 925
    if-ne v1, v7, :cond_1

    .line 926
    const-string v4, "Grp record don\'t exist"

    invoke-direct {p0, p5, v4}, Lcom/android/internal/telephony/AdnRecordCache;->sendErrorResponse(Landroid/os/Message;Ljava/lang/String;)V

    goto :goto_0

    .line 930
    :cond_1
    iget-object v4, p0, Lcom/android/internal/telephony/AdnRecordCache;->userWriteResponse:Landroid/util/SparseArray;

    invoke-virtual {v4, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/Message;

    .line 932
    .local v3, pendingResponse:Landroid/os/Message;
    if-eqz v3, :cond_2

    .line 933
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Have pending update for EF:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, p5, v4}, Lcom/android/internal/telephony/AdnRecordCache;->sendErrorResponse(Landroid/os/Message;Ljava/lang/String;)V

    goto :goto_0

    .line 937
    :cond_2
    iget-object v4, p0, Lcom/android/internal/telephony/AdnRecordCache;->userWriteResponse:Landroid/util/SparseArray;

    invoke-virtual {v4, v0, p5}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 939
    invoke-direct {p0, v0, v1, p3, p4}, Lcom/android/internal/telephony/AdnRecordCache;->updateGsdTag(IILjava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public updateAdnSne(Lcom/android/internal/telephony/AdnRecord;IILjava/lang/String;)V
    .locals 10
    .parameter "adn"
    .parameter "sneIndex"
    .parameter "recNum"
    .parameter "pin2"

    .prologue
    .line 1047
    const-string v0, "AdnRecordCache"

    const-string v1, "begin updateAdnSne()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1049
    iget-object v9, p0, Lcom/android/internal/telephony/AdnRecordCache;->mLock:Ljava/lang/Object;

    monitor-enter v9

    .line 1051
    :try_start_0
    invoke-virtual {p1}, Lcom/android/internal/telephony/AdnRecord;->getSneEfids()[I

    move-result-object v0

    const/4 v1, 0x0

    aget v2, v0, v1

    .line 1052
    .local v2, sneEF:I
    if-gez v2, :cond_0

    .line 1053
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUpdateSneSuccess:Z

    .line 1054
    monitor-exit v9

    .line 1072
    :goto_0
    return-void

    .line 1056
    :cond_0
    const-string v0, "AdnRecordCache"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "sneEF = "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1057
    const-string v0, "AdnRecordCache"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "sneIndex = "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1058
    const/4 v0, -0x1

    if-eq p2, v0, :cond_1

    if-nez p2, :cond_2

    .line 1059
    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/telephony/AdnRecordCache;->mUpdateSneSuccess:Z

    .line 1060
    monitor-exit v9

    goto :goto_0

    .line 1071
    .end local v2           #sneEF:I
    :catchall_0
    move-exception v0

    monitor-exit v9
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 1063
    .restart local v2       #sneEF:I
    :cond_2
    :try_start_1
    invoke-virtual {p1}, Lcom/android/internal/telephony/AdnRecord;->getSnes()[Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v8, v0, v1

    .line 1064
    .local v8, sne:Ljava/lang/String;
    new-instance v0, Lcom/android/internal/telephony/AdnRecordLoader;

    iget-object v1, p0, Lcom/android/internal/telephony/AdnRecordCache;->mFh:Lcom/android/internal/telephony/IccFileHandler;

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/AdnRecordLoader;-><init>(Lcom/android/internal/telephony/IccFileHandler;)V

    iget v4, p1, Lcom/android/internal/telephony/AdnRecord;->recordNumber:I

    const/4 v1, 0x7

    invoke-virtual {p0, v1, p3, p2, p1}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v6

    move-object v1, p1

    move v3, p2

    move-object v5, p4

    invoke-virtual/range {v0 .. v6}, Lcom/android/internal/telephony/AdnRecordLoader;->updateSneEF(Lcom/android/internal/telephony/AdnRecord;IIILjava/lang/String;Landroid/os/Message;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1067
    :try_start_2
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecordCache;->mLock:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->wait()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    .line 1071
    :goto_1
    :try_start_3
    monitor-exit v9

    goto :goto_0

    .line 1068
    :catch_0
    move-exception v7

    .line 1069
    .local v7, e:Ljava/lang/InterruptedException;
    const-string v0, "AdnRecordCache"

    const-string v1, "Interrupted Exception in updateAdnSne"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1
.end method
