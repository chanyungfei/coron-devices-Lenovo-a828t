.class Lcom/android/internal/telephony/cat/SetRefreshParams;
.super Lcom/android/internal/telephony/cat/CommandParams;
.source "CommandParams.java"


# instance fields
.field fileChanged:Z

.field fileList:[I


# direct methods
.method constructor <init>(Lcom/android/internal/telephony/cat/CommandDetails;Z[I)V
    .locals 0
    .parameter "cmdDet"
    .parameter "fileChanged"
    .parameter "filelist"

    .prologue
    .line 49
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/cat/CommandParams;-><init>(Lcom/android/internal/telephony/cat/CommandDetails;)V

    .line 50
    iput-boolean p2, p0, Lcom/android/internal/telephony/cat/SetRefreshParams;->fileChanged:Z

    .line 51
    iput-object p3, p0, Lcom/android/internal/telephony/cat/SetRefreshParams;->fileList:[I

    .line 52
    return-void
.end method
