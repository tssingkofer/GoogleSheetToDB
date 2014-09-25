#!/bin/bash
OLDIFS=$IFS

curl -L "https://docs.google.com/spreadsheets/export?id=1sxIMF7H_ksLk34iFSgO8JFCbSHABlE_BPk3NNsdBOGo&exportFormat=csv&gid=0" -o ./DashSheet

echo
echo
echo "use dash;" > ./insertSQL.sql

IFS=","
while read f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 f12 f13 f14 f15 f16 f17 f18 f19 f20
do
      echo "insert into trips (trip_date, start_address, start_weather, start_latitude, start_longitude, start_map, trip_score, trip_distance, engine_alerts, brake_alerts, accel_alerts, speed_alerts, sms_alerts, fuel_used, fuel_cost, end_address, end_weather, end_latitude, end_longitude, end_map)
	SELECT * FROM (SELECT curdate(), $f1,'$f2','$f3','$f4','$f5','$f6','$f7','$f8','$f9','$f10','$f11','$f12','$f13','$f14',$f15,'$f16','$f17','$f18','$f19','$f20') as tmp WHERE (Select count(*) from trips where start_map='$f5') = '0';" >> ./insertSQL.sql
done < DashSheet
IFS=$OLDIFS
