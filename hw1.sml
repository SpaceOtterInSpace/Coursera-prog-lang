(*  use "hw1test.sml";   *)

val date1 = (2014,10,08)
val date2 = (2013,11,4)

fun is_older (date1 : int*int*int, date2 : int*int*int) =
     (#1 date1) * 10000 + (#2 date1) * 100 + (#3 date1) < (#1 date2) * 10000
     + (#2 date2) * 100 + (#3 date2)

fun number_in_month (dates : (int * int * int) list, month : int) =
	if null dates
	then 0
	else 
		if (#2 (hd dates)) = month
		then 1 + number_in_month(tl dates, month)
		else number_in_month(tl dates, month)

fun number_in_months (dates : (int * int * int) list, months : int list) = 
	if null months
	then 0
	else number_in_month(dates, hd months) + number_in_months(dates, tl months)

fun dates_in_month(dates : (int * int * int) list, month : int) =
	if null dates
	then []
	else 
		if (#2 (hd dates)) = month
		then hd dates :: dates_in_month(tl dates, month)
		else dates_in_month(tl dates, month)

fun dates_in_months (dates : (int * int * int) list, months : int list) =
	if null months
	then []
	else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months)

fun get_nth (items : string list, n : int) =
	if n = 1
	then hd items
	else get_nth(tl items, n-1)

fun date_to_string(date : int*int*int) =
	let val months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
	in get_nth (months, #2 date) ^ " " ^ Int.toString(#3 date)^ ", " ^ Int.toString(#1 date)
	end

fun number_before_reaching_sum (sum : int, numbers : int list) =
	if null (tl numbers)
	then 0
	else
		if sum <= hd numbers + hd (tl numbers)
		then 1
		else 1 + number_before_reaching_sum(sum - hd numbers, tl numbers)









