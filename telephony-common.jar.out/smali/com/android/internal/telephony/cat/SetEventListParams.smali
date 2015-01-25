.class Lcom/android/internal/telephony/cat/SetEventListParams;
.super Lcom/android/internal/telephony/cat/CommandParams;
.source "CommandParams.java"


# instance fields
.field events:[I


# direct methods
.method constructor <init>(Lcom/android/internal/telephony/cat/CommandDetails;[I)V
    .locals 0
    .parameter "cmdDet"
    .parameter "events"

    .prologue
    .line 59
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/cat/CommandParams;-><init>(Lcom/android/internal/telephony/cat/CommandDetails;)V

    .line 60
    iput-object p2, p0, Lcom/android/internal/telephony/cat/SetEventListParams;->events:[I

    .line 61
    return-void
.end method
