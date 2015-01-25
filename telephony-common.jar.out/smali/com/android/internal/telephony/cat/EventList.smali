.class public final enum Lcom/android/internal/telephony/cat/EventList;
.super Ljava/lang/Enum;
.source "EventList.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/android/internal/telephony/cat/EventList;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/android/internal/telephony/cat/EventList;

.field public static final enum BROWER_TERMINATION:Lcom/android/internal/telephony/cat/EventList;

.field public static final enum BROWSING_STATUS:Lcom/android/internal/telephony/cat/EventList;

.field public static final enum CALL_CONNECTED:Lcom/android/internal/telephony/cat/EventList;

.field public static final enum CALL_DISCONNECTED:Lcom/android/internal/telephony/cat/EventList;

.field public static final enum CARD_READER_STATUS:Lcom/android/internal/telephony/cat/EventList;

.field public static final enum CHANNEL_STATUS:Lcom/android/internal/telephony/cat/EventList;

.field public static final enum DATA_AVAILABLE:Lcom/android/internal/telephony/cat/EventList;

.field public static final enum DISPLAY_PARAMETERS_CHANGED:Lcom/android/internal/telephony/cat/EventList;

.field public static final enum FRAMES_INFORMATION_CHANGE:Lcom/android/internal/telephony/cat/EventList;

.field public static final enum HCI_CONNECTIVITY_EVENT:Lcom/android/internal/telephony/cat/EventList;

.field public static final enum IDLE_SCREEN_AVAILABLE:Lcom/android/internal/telephony/cat/EventList;

.field public static final enum LANGUAGE_SELECTION:Lcom/android/internal/telephony/cat/EventList;

.field public static final enum LOCAL_CONNECTION:Lcom/android/internal/telephony/cat/EventList;

.field public static final enum LOCATION_SATATUS:Lcom/android/internal/telephony/cat/EventList;

.field public static final enum MT_CALL:Lcom/android/internal/telephony/cat/EventList;

.field public static final enum MULTIPLE_ACCESS_TECHNOLOGY_CHANGE:Lcom/android/internal/telephony/cat/EventList;

.field public static final enum NETWORK_SEARCH_MODE_CHANGE:Lcom/android/internal/telephony/cat/EventList;

.field public static final enum REMOVE_EVENT:Lcom/android/internal/telephony/cat/EventList;

.field public static final enum SINGLE_ACCESS_TECHNOLOGY_CHANGE:Lcom/android/internal/telephony/cat/EventList;

.field public static final enum USER_ACTIVITY:Lcom/android/internal/telephony/cat/EventList;


# instance fields
.field private mValue:I


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 19
    new-instance v0, Lcom/android/internal/telephony/cat/EventList;

    const-string v1, "MT_CALL"

    invoke-direct {v0, v1, v4, v4}, Lcom/android/internal/telephony/cat/EventList;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/android/internal/telephony/cat/EventList;->MT_CALL:Lcom/android/internal/telephony/cat/EventList;

    .line 22
    new-instance v0, Lcom/android/internal/telephony/cat/EventList;

    const-string v1, "CALL_CONNECTED"

    invoke-direct {v0, v1, v5, v5}, Lcom/android/internal/telephony/cat/EventList;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/android/internal/telephony/cat/EventList;->CALL_CONNECTED:Lcom/android/internal/telephony/cat/EventList;

    .line 25
    new-instance v0, Lcom/android/internal/telephony/cat/EventList;

    const-string v1, "CALL_DISCONNECTED"

    invoke-direct {v0, v1, v6, v6}, Lcom/android/internal/telephony/cat/EventList;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/android/internal/telephony/cat/EventList;->CALL_DISCONNECTED:Lcom/android/internal/telephony/cat/EventList;

    .line 28
    new-instance v0, Lcom/android/internal/telephony/cat/EventList;

    const-string v1, "LOCATION_SATATUS"

    invoke-direct {v0, v1, v7, v7}, Lcom/android/internal/telephony/cat/EventList;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/android/internal/telephony/cat/EventList;->LOCATION_SATATUS:Lcom/android/internal/telephony/cat/EventList;

    .line 31
    new-instance v0, Lcom/android/internal/telephony/cat/EventList;

    const-string v1, "USER_ACTIVITY"

    invoke-direct {v0, v1, v8, v8}, Lcom/android/internal/telephony/cat/EventList;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/android/internal/telephony/cat/EventList;->USER_ACTIVITY:Lcom/android/internal/telephony/cat/EventList;

    .line 34
    new-instance v0, Lcom/android/internal/telephony/cat/EventList;

    const-string v1, "IDLE_SCREEN_AVAILABLE"

    const/4 v2, 0x5

    const/4 v3, 0x5

    invoke-direct {v0, v1, v2, v3}, Lcom/android/internal/telephony/cat/EventList;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/android/internal/telephony/cat/EventList;->IDLE_SCREEN_AVAILABLE:Lcom/android/internal/telephony/cat/EventList;

    .line 37
    new-instance v0, Lcom/android/internal/telephony/cat/EventList;

    const-string v1, "CARD_READER_STATUS"

    const/4 v2, 0x6

    const/4 v3, 0x6

    invoke-direct {v0, v1, v2, v3}, Lcom/android/internal/telephony/cat/EventList;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/android/internal/telephony/cat/EventList;->CARD_READER_STATUS:Lcom/android/internal/telephony/cat/EventList;

    .line 40
    new-instance v0, Lcom/android/internal/telephony/cat/EventList;

    const-string v1, "LANGUAGE_SELECTION"

    const/4 v2, 0x7

    const/4 v3, 0x7

    invoke-direct {v0, v1, v2, v3}, Lcom/android/internal/telephony/cat/EventList;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/android/internal/telephony/cat/EventList;->LANGUAGE_SELECTION:Lcom/android/internal/telephony/cat/EventList;

    .line 43
    new-instance v0, Lcom/android/internal/telephony/cat/EventList;

    const-string v1, "BROWER_TERMINATION"

    const/16 v2, 0x8

    const/16 v3, 0x8

    invoke-direct {v0, v1, v2, v3}, Lcom/android/internal/telephony/cat/EventList;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/android/internal/telephony/cat/EventList;->BROWER_TERMINATION:Lcom/android/internal/telephony/cat/EventList;

    .line 46
    new-instance v0, Lcom/android/internal/telephony/cat/EventList;

    const-string v1, "DATA_AVAILABLE"

    const/16 v2, 0x9

    const/16 v3, 0x9

    invoke-direct {v0, v1, v2, v3}, Lcom/android/internal/telephony/cat/EventList;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/android/internal/telephony/cat/EventList;->DATA_AVAILABLE:Lcom/android/internal/telephony/cat/EventList;

    .line 49
    new-instance v0, Lcom/android/internal/telephony/cat/EventList;

    const-string v1, "CHANNEL_STATUS"

    const/16 v2, 0xa

    const/16 v3, 0xa

    invoke-direct {v0, v1, v2, v3}, Lcom/android/internal/telephony/cat/EventList;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/android/internal/telephony/cat/EventList;->CHANNEL_STATUS:Lcom/android/internal/telephony/cat/EventList;

    .line 52
    new-instance v0, Lcom/android/internal/telephony/cat/EventList;

    const-string v1, "SINGLE_ACCESS_TECHNOLOGY_CHANGE"

    const/16 v2, 0xb

    const/16 v3, 0xb

    invoke-direct {v0, v1, v2, v3}, Lcom/android/internal/telephony/cat/EventList;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/android/internal/telephony/cat/EventList;->SINGLE_ACCESS_TECHNOLOGY_CHANGE:Lcom/android/internal/telephony/cat/EventList;

    .line 53
    new-instance v0, Lcom/android/internal/telephony/cat/EventList;

    const-string v1, "DISPLAY_PARAMETERS_CHANGED"

    const/16 v2, 0xc

    const/16 v3, 0xc

    invoke-direct {v0, v1, v2, v3}, Lcom/android/internal/telephony/cat/EventList;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/android/internal/telephony/cat/EventList;->DISPLAY_PARAMETERS_CHANGED:Lcom/android/internal/telephony/cat/EventList;

    .line 54
    new-instance v0, Lcom/android/internal/telephony/cat/EventList;

    const-string v1, "LOCAL_CONNECTION"

    const/16 v2, 0xd

    const/16 v3, 0xd

    invoke-direct {v0, v1, v2, v3}, Lcom/android/internal/telephony/cat/EventList;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/android/internal/telephony/cat/EventList;->LOCAL_CONNECTION:Lcom/android/internal/telephony/cat/EventList;

    .line 55
    new-instance v0, Lcom/android/internal/telephony/cat/EventList;

    const-string v1, "NETWORK_SEARCH_MODE_CHANGE"

    const/16 v2, 0xe

    const/16 v3, 0xe

    invoke-direct {v0, v1, v2, v3}, Lcom/android/internal/telephony/cat/EventList;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/android/internal/telephony/cat/EventList;->NETWORK_SEARCH_MODE_CHANGE:Lcom/android/internal/telephony/cat/EventList;

    .line 56
    new-instance v0, Lcom/android/internal/telephony/cat/EventList;

    const-string v1, "BROWSING_STATUS"

    const/16 v2, 0xf

    const/16 v3, 0xf

    invoke-direct {v0, v1, v2, v3}, Lcom/android/internal/telephony/cat/EventList;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/android/internal/telephony/cat/EventList;->BROWSING_STATUS:Lcom/android/internal/telephony/cat/EventList;

    .line 57
    new-instance v0, Lcom/android/internal/telephony/cat/EventList;

    const-string v1, "FRAMES_INFORMATION_CHANGE"

    const/16 v2, 0x10

    const/16 v3, 0x10

    invoke-direct {v0, v1, v2, v3}, Lcom/android/internal/telephony/cat/EventList;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/android/internal/telephony/cat/EventList;->FRAMES_INFORMATION_CHANGE:Lcom/android/internal/telephony/cat/EventList;

    .line 60
    new-instance v0, Lcom/android/internal/telephony/cat/EventList;

    const-string v1, "HCI_CONNECTIVITY_EVENT"

    const/16 v2, 0x11

    const/16 v3, 0x13

    invoke-direct {v0, v1, v2, v3}, Lcom/android/internal/telephony/cat/EventList;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/android/internal/telephony/cat/EventList;->HCI_CONNECTIVITY_EVENT:Lcom/android/internal/telephony/cat/EventList;

    .line 61
    new-instance v0, Lcom/android/internal/telephony/cat/EventList;

    const-string v1, "MULTIPLE_ACCESS_TECHNOLOGY_CHANGE"

    const/16 v2, 0x12

    const/16 v3, 0x14

    invoke-direct {v0, v1, v2, v3}, Lcom/android/internal/telephony/cat/EventList;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/android/internal/telephony/cat/EventList;->MULTIPLE_ACCESS_TECHNOLOGY_CHANGE:Lcom/android/internal/telephony/cat/EventList;

    .line 62
    new-instance v0, Lcom/android/internal/telephony/cat/EventList;

    const-string v1, "REMOVE_EVENT"

    const/16 v2, 0x13

    const/16 v3, 0x15

    invoke-direct {v0, v1, v2, v3}, Lcom/android/internal/telephony/cat/EventList;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/android/internal/telephony/cat/EventList;->REMOVE_EVENT:Lcom/android/internal/telephony/cat/EventList;

    .line 17
    const/16 v0, 0x14

    new-array v0, v0, [Lcom/android/internal/telephony/cat/EventList;

    sget-object v1, Lcom/android/internal/telephony/cat/EventList;->MT_CALL:Lcom/android/internal/telephony/cat/EventList;

    aput-object v1, v0, v4

    sget-object v1, Lcom/android/internal/telephony/cat/EventList;->CALL_CONNECTED:Lcom/android/internal/telephony/cat/EventList;

    aput-object v1, v0, v5

    sget-object v1, Lcom/android/internal/telephony/cat/EventList;->CALL_DISCONNECTED:Lcom/android/internal/telephony/cat/EventList;

    aput-object v1, v0, v6

    sget-object v1, Lcom/android/internal/telephony/cat/EventList;->LOCATION_SATATUS:Lcom/android/internal/telephony/cat/EventList;

    aput-object v1, v0, v7

    sget-object v1, Lcom/android/internal/telephony/cat/EventList;->USER_ACTIVITY:Lcom/android/internal/telephony/cat/EventList;

    aput-object v1, v0, v8

    const/4 v1, 0x5

    sget-object v2, Lcom/android/internal/telephony/cat/EventList;->IDLE_SCREEN_AVAILABLE:Lcom/android/internal/telephony/cat/EventList;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/android/internal/telephony/cat/EventList;->CARD_READER_STATUS:Lcom/android/internal/telephony/cat/EventList;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/android/internal/telephony/cat/EventList;->LANGUAGE_SELECTION:Lcom/android/internal/telephony/cat/EventList;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/android/internal/telephony/cat/EventList;->BROWER_TERMINATION:Lcom/android/internal/telephony/cat/EventList;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/android/internal/telephony/cat/EventList;->DATA_AVAILABLE:Lcom/android/internal/telephony/cat/EventList;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/android/internal/telephony/cat/EventList;->CHANNEL_STATUS:Lcom/android/internal/telephony/cat/EventList;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lcom/android/internal/telephony/cat/EventList;->SINGLE_ACCESS_TECHNOLOGY_CHANGE:Lcom/android/internal/telephony/cat/EventList;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lcom/android/internal/telephony/cat/EventList;->DISPLAY_PARAMETERS_CHANGED:Lcom/android/internal/telephony/cat/EventList;

    aput-object v2, v0, v1

    const/16 v1, 0xd

    sget-object v2, Lcom/android/internal/telephony/cat/EventList;->LOCAL_CONNECTION:Lcom/android/internal/telephony/cat/EventList;

    aput-object v2, v0, v1

    const/16 v1, 0xe

    sget-object v2, Lcom/android/internal/telephony/cat/EventList;->NETWORK_SEARCH_MODE_CHANGE:Lcom/android/internal/telephony/cat/EventList;

    aput-object v2, v0, v1

    const/16 v1, 0xf

    sget-object v2, Lcom/android/internal/telephony/cat/EventList;->BROWSING_STATUS:Lcom/android/internal/telephony/cat/EventList;

    aput-object v2, v0, v1

    const/16 v1, 0x10

    sget-object v2, Lcom/android/internal/telephony/cat/EventList;->FRAMES_INFORMATION_CHANGE:Lcom/android/internal/telephony/cat/EventList;

    aput-object v2, v0, v1

    const/16 v1, 0x11

    sget-object v2, Lcom/android/internal/telephony/cat/EventList;->HCI_CONNECTIVITY_EVENT:Lcom/android/internal/telephony/cat/EventList;

    aput-object v2, v0, v1

    const/16 v1, 0x12

    sget-object v2, Lcom/android/internal/telephony/cat/EventList;->MULTIPLE_ACCESS_TECHNOLOGY_CHANGE:Lcom/android/internal/telephony/cat/EventList;

    aput-object v2, v0, v1

    const/16 v1, 0x13

    sget-object v2, Lcom/android/internal/telephony/cat/EventList;->REMOVE_EVENT:Lcom/android/internal/telephony/cat/EventList;

    aput-object v2, v0, v1

    sput-object v0, Lcom/android/internal/telephony/cat/EventList;->$VALUES:[Lcom/android/internal/telephony/cat/EventList;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .parameter
    .parameter
    .parameter "value"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .prologue
    .line 65
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 66
    iput p3, p0, Lcom/android/internal/telephony/cat/EventList;->mValue:I

    .line 67
    return-void
.end method

.method public static fromInt(I)Lcom/android/internal/telephony/cat/EventList;
    .locals 5
    .parameter "value"

    .prologue
    .line 74
    invoke-static {}, Lcom/android/internal/telephony/cat/EventList;->values()[Lcom/android/internal/telephony/cat/EventList;

    move-result-object v0

    .local v0, arr$:[Lcom/android/internal/telephony/cat/EventList;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_1

    aget-object v3, v0, v1

    .line 75
    .local v3, r:Lcom/android/internal/telephony/cat/EventList;
    iget v4, v3, Lcom/android/internal/telephony/cat/EventList;->mValue:I

    if-ne v4, p0, :cond_0

    .line 79
    .end local v3           #r:Lcom/android/internal/telephony/cat/EventList;
    :goto_1
    return-object v3

    .line 74
    .restart local v3       #r:Lcom/android/internal/telephony/cat/EventList;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 79
    .end local v3           #r:Lcom/android/internal/telephony/cat/EventList;
    :cond_1
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/internal/telephony/cat/EventList;
    .locals 1
    .parameter "name"

    .prologue
    .line 17
    const-class v0, Lcom/android/internal/telephony/cat/EventList;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/cat/EventList;

    return-object v0
.end method

.method public static values()[Lcom/android/internal/telephony/cat/EventList;
    .locals 1

    .prologue
    .line 17
    sget-object v0, Lcom/android/internal/telephony/cat/EventList;->$VALUES:[Lcom/android/internal/telephony/cat/EventList;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/android/internal/telephony/cat/EventList;

    return-object v0
.end method


# virtual methods
.method public value()I
    .locals 1

    .prologue
    .line 70
    iget v0, p0, Lcom/android/internal/telephony/cat/EventList;->mValue:I

    return v0
.end method
