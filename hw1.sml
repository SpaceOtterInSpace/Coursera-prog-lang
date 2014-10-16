val date1 = (2014,10,08)
val date2 = (2013,11,4)

fun is_older (date1 : int*int*int, date2 : int*int*int) =
     (#1 date1) * 10000 + (#2 date1) * 100 + (#3 date1) < (#1 date2) * 10000
     + (#2 date2) * 100 + (#3 date2)

