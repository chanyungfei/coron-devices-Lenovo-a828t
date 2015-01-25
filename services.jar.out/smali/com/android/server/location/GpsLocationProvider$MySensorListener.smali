.class Lcom/android/server/location/GpsLocationProvider$MySensorListener;
.super Ljava/lang/Object;
.source "GpsLocationProvider.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/location/GpsLocationProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MySensorListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/location/GpsLocationProvider;

.field private values:[F


# direct methods
.method private constructor <init>(Lcom/android/server/location/GpsLocationProvider;)V
    .locals 1
    .parameter

    .prologue
    .line 1922
    iput-object p1, p0, Lcom/android/server/location/GpsLocationProvider$MySensorListener;->this$0:Lcom/android/server/location/GpsLocationProvider;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1923
    const/4 v0, 0x3

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/android/server/location/GpsLocationProvider$MySensorListener;->values:[F

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/server/location/GpsLocationProvider;Lcom/android/server/location/GpsLocationProvider$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 1922
    invoke-direct {p0, p1}, Lcom/android/server/location/GpsLocationProvider$MySensorListener;-><init>(Lcom/android/server/location/GpsLocationProvider;)V

    return-void
.end method


# virtual methods
.method public final onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0
    .parameter "sensor"
    .parameter "accuracy"

    .prologue
    .line 1928
    return-void
.end method

.method public final onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 7
    .parameter "event"

    .prologue
    .line 1932
    const/4 v6, 0x0

    .local v6, i:I
    :goto_0
    const/4 v0, 0x3

    if-ge v6, v0, :cond_0

    .line 1933
    iget-object v0, p0, Lcom/android/server/location/GpsLocationProvider$MySensorListener;->values:[F

    iget-object v1, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v1, v1, v6

    aput v1, v0, v6

    .line 1932
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 1935
    :cond_0
    iget-object v0, p0, Lcom/android/server/location/GpsLocationProvider$MySensorListener;->this$0:Lcom/android/server/location/GpsLocationProvider;

    iget-object v1, p0, Lcom/android/server/location/GpsLocationProvider$MySensorListener;->values:[F

    iget-object v2, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v2}, Landroid/hardware/Sensor;->getType()I

    move-result v2

    iget-wide v3, p1, Landroid/hardware/SensorEvent;->timestamp:J

    iget v5, p1, Landroid/hardware/SensorEvent;->accuracy:I

    #calls: Lcom/android/server/location/GpsLocationProvider;->native_agps_inject_sensor_data([FIJI)V
    invoke-static/range {v0 .. v5}, Lcom/android/server/location/GpsLocationProvider;->access$1800(Lcom/android/server/location/GpsLocationProvider;[FIJI)V

    .line 1936
    return-void
.end method
