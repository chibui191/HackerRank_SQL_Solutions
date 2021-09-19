SELECT 
    ROUND(ABS(MIN(lat_n)-MAX(lat_n)) + ABS(min(long_w)-max(long_w)), 4)
FROM station;