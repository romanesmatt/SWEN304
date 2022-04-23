Select DISTINCT r.RobberId,r.NickName
From Robbers r , HasAccounts ha ,Accomplices a
WHERE r.RobberId =ha.RobberId AND ha.RobberId = a.RobberId AND ha.BankName =
a.BankName AND ha.City = a.City