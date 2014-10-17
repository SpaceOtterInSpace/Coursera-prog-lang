val date1 = (2014,10,08)
val date2 = (2013,11,4)

fun is_older (date1 : int*int*int, date2 : int*int*int) =
     (#1 date1) * 10000 + (#2 date1) * 100 + (#3 date1) < (#1 date2) * 10000
     + (#2 date2) * 100 + (#3 date2)

fun number_in_month (dates : (int * int * int) list, month : int) =
	if null dates
	then number_in_months
	else 
		if (#2 (hd dates)) = month
		then 1 + number_in_months(tl dates, month)
		else number_in_months(tl dates, month)
