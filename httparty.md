require 'httparty'
response = HTTParty.get("https://jgentes-Crime-Data-v1.p.mashape.com/crime?enddate=6%2F23%2F2015&lat=42.343060293817736&long=-83.0579091956167&startdate=6%2F19%2F2015",
                         headers: { "X-Mashape-Key" => "1Nh8Dmk92ImshSPviOWoRZwNxpukp1YUHA0jsnd8thcqBXt0e6", "Accept" => "application/json" })
response.parsed_response

                                                  ```
                         [
                           {
                             "id"=>"14349960000009241915.466836685215183.12455249",
                             "description"=>"INTIMIDATION",
                             "datetime"=>"6/22/2015 06:00 PM",
                             "lat"=>42.36082276481888,
                             "long"=>-83.02153919555661
                           },
                           {
                             "id"=>"14349852000009250698.566088675212148.73448517",
                             "description"=>"AGG/FEL ASSAULT - NON-FAMILY - GUN",
                             "datetime"=>"6/22/2015 03:00 PM",
                             "lat"=>42.340677869817505,
                             "long"=>-83.1004391185676
                           },
                           {
                             "id"=>"14349822000009241511.099899585212082.35234378",
                             "description"=>"LARCENY (OTHER)",
                             "datetime"=>"6/22/2015 02:10 PM",
                             "lat"=>42.34023709581753,
                             "long"=>-83.01790670555621
                           },
                           {
                             "id"=>"14349780000009246362.823428115212192.3707699",
                             "description"=>"INTIMIDATION",
                             "datetime"=>"6/22/2015 01:00 PM",
                             "lat"=>42.34096761081761,
                             "long"=>-83.06149047956228
                           },
                           {
                             "id"=>"14349708000009247383.830212935209912.96269028",
                             "description"=>"DAMAGE TO PROPERTY - PRIVATE PROPERTY",
                             "datetime"=>"6/22/2015 11:00 AM",
                             "lat"=>42.32583075981664,
                             "long"=>-83.0706623395635
                           },
                           {
                             "id"=>"14349708000009247383.830212935209912.96269028",
                             "description"=>"LARCENY - PERSONAL PROPERTY FROM VEHICLE",
                             "datetime"=>"6/22/2015 11:00 AM",
                             "lat"=>42.32583075981664,
                             "long"=>-83.0706623395635
                           },
                           {
                             "id"=>"14349450000009248780.613527415211112.35301925",
                             "description"=>"LARCENY - PERSONAL PROPERTY FROM VEHICLE",
                             "datetime"=>"6/22/2015 03:50 AM",
                             "lat"=>42.333795997817184,
                             "long"=>-83.08320985756525
                           },
                           {
                             "id"=>"14349447000009251298.231495155212318.22254916",
                             "description"=>"ROBBERY - MOTOR VEHICLE (CAR JACKING)",
                             "datetime"=>"6/22/2015 03:45 AM",
                             "lat"=>42.341803247817666,
                             "long"=>-83.10582600456834
                           },
                           {
                             "id"=>"14349420000009246666.386336165210547.27324913",
                             "description"=>"VEHICLE THEFT",
                             "datetime"=>"6/22/2015 03:00 AM",
                             "lat"=>42.33004338781689,
                             "long"=>-83.0642174315626
                           },
                           {
                             "id"=>"14349396000009244668.268379435211414.31689186",
                             "description"=>"LARCENY - FROM BUILDING (INCLUDES LIBRARY, OFFICE USED BY PUBLIC, ETC)",
                             "datetime"=>"6/22/2015 02:20 AM",
                             "lat"=>42.33580120281725,
                             "long"=>-83.04626803256005
                           },
                           {
                             "id"=>"14349348000009247193.276291585213621.25667071",
                             "description"=>"ASSAULT AND BATTERY/SIMPLE ASSAULT",
                             "datetime"=>"6/22/2015 01:00 AM",
                             "lat"=>42.35045454681821,
                             "long"=>-83.06895056456328
                           },
                           {
                             "id"=>"14349330000009246944.164644525211963.51282518",
                             "description"=>"FRAUD (OTHER)",
                             "datetime"=>"6/22/2015 12:30 AM",
                             "lat"=>42.33944799981748,
                             "long"=>-83.06671275656291
                           },
                           {
                             "id"=>"14349330000009246990.056215925213916.02607755",
                             "description"=>"OPERATING UNDER THE INFLUENCE OF ALCOHOL",
                             "datetime"=>"6/22/2015 12:30 AM",
                             "lat"=>42.352411458818274,
                             "long"=>-83.06712500756296
                           },
                           {
                             "id"=>"14349324000009250777.27776295213192.18218781",
                             "description"=>"AGG/FEL ASSAULT - NON-FAMILY - OTHER WEAPON",
                             "datetime"=>"6/22/2015 12:20 AM",
                             "lat"=>42.34760590281796,
                             "long"=>-83.10114619756769
                           },
                           {
                             "id"=>"14349312600009244668.268379435211414.31689186",
                             "description"=>"LARCENY - FROM BUILDING (INCLUDES LIBRARY, OFFICE USED BY PUBLIC, ETC)",
                             "datetime"=>"6/22/2015 12:01 AM",
                             "lat"=>42.33580120281725,
                             "long"=>-83.04626803256005
                           },
                           {
                             "id"=>"14349303000009244338.052468345211245.86479813",
                             "description"=>"HOMICIDE-FATAL SHOOTING",
                             "datetime"=>"6/21/2015 11:45 PM",
                             "lat"=>42.334682596817196,
                             "long"=>-83.04330165255973
                           },
                           {
                             "id"=>"14349276000009246703.767755135212546.87143465",
                             "description"=>"ROBBERY - STREET - STRONG ARM",
                             "datetime"=>"6/21/2015 11:00 PM",
                             "lat"=>42.34332141381771,
                             "long"=>-83.06455323456267
                           },
                           {
                             "id"=>"14349249000009244119.680474155211019.77747035",
                             "description"=>"MARIJUANA -POSSESS",
                             "datetime"=>"6/21/2015 10:15 PM",
                             "lat"=>42.333181232817104,
                             "long"=>-83.04133998355941
                           },
                           {
                             "id"=>"14349240000009245192.12588065213292.33539315",
                             "description"=>"BURGLARY - NO FORCED ENTRY - RESIDENCE",
                             "datetime"=>"6/21/2015 10:00 PM",
                             "lat"=>42.348270835818035,
                             "long"=>-83.05097392456074
                           },
                           {
                             "id"=>"14349024000009240164.984207925214994.82315139",
                             "description"=>"ASSAULT AND BATTERY/SIMPLE ASSAULT",
                             "datetime"=>"6/21/2015 04:00 PM",
                             "lat"=>42.35957284581875,
                             "long"=>-83.00581434255442
                           },
                           {
                             "id"=>"14349003600009246382.522191235213967.60766049",
                             "description"=>"LARCENY - FROM BUILDING (INCLUDES LIBRARY, OFFICE USED BY PUBLIC, ETC)",
                             "datetime"=>"6/21/2015 03:26 PM",
                             "lat"=>42.35275389181833,
                             "long"=>-83.06166743656219
                           },
                           {
                             "id"=>"14348982000009244553.266773845211338.74253474",
                             "description"=>"LARCENY (OTHER)",
                             "datetime"=>"6/21/2015 02:50 PM",
                             "lat"=>42.33529935381719,
                             "long"=>-83.04523495555992
                           },
                           {
                             "id"=>"14348958000009252050.184970665210399.36627531",
                             "description"=>"TELEPHONE USED FOR HARASSMENT, THREATS",
                             "datetime"=>"6/21/2015 02:10 PM",
                             "lat"=>42.3290611228168,
                             "long"=>-83.11258091756926
                           },
                           {
                             "id"=>"14348817000009245987.118922165210927.22270352",
                             "description"=>"LARCENY (OTHER)",
                             "datetime"=>"6/21/2015 10:15 AM",
                             "lat"=>42.33256659981705,
                             "long"=>-83.05811546856172
                           },
                           {
                             "id"=>"14348619000009245027.260044955214638.12225887",
                             "description"=>"BURGLARY - BURGLARY - FORCED ENTRY - RESIDENCE",
                             "datetime"=>"6/21/2015 04:45 AM",
                             "lat"=>42.35720504581862,
                             "long"=>-83.04949290956057
                           },
                           {
                             "id"=>"14348592000009246766.625084845213998.43159881",
                             "description"=>"ROBBERY - STREET - STRONG ARM",
                             "datetime"=>"6/21/2015 04:00 AM",
                             "lat"=>42.3529585208183,
                             "long"=>-83.0651178915627
                           },
                           {
                             "id"=>"14348527200009244589.415440775210972.35123309",
                             "description"=>"LARCENY (OTHER)",
                             "datetime"=>"6/21/2015 02:12 AM",
                             "lat"=>42.33286628781707,
                             "long"=>-83.04555968455999
                           },
                           {
                             "id"=>"14348520000009244191.44892915213380.13549458",
                             "description"=>"LARCENY - PERSONAL PROPERTY FROM VEHICLE",
                             "datetime"=>"6/21/2015 02:00 AM",
                             "lat"=>42.348853748818094,
                             "long"=>-83.04198469055947
                           },
                           {
                             "id"=>"14348520000009243732.240222215210337.39725783",
                             "description"=>"ASSAULT AND BATTERY/SIMPLE ASSAULT",
                             "datetime"=>"6/21/2015 02:00 AM",
                             "lat"=>42.32864957581682,
                             "long"=>-83.03785954855891
                           },
                           {
                             "id"=>"14348490000009245987.118922165210927.22270352",
                             "description"=>"ASSAULT AND BATTERY/SIMPLE ASSAULT",
                             "datetime"=>"6/21/2015 01:10 AM",
                             "lat"=>42.33256659981705,
                             "long"=>-83.05811546856172
                           },
                           {
                             "id"=>"14348484000009243309.251204085212563.83922179",
                             "description"=>"AGG/FEL ASSAULT - NON-FAMILY - STRONG ARM",
                             "datetime"=>"6/21/2015 01:00 AM",
                             "lat"=>42.343434073817754,
                             "long"=>-83.03405977355838
                           },
                           {
                             "id"=>"14348475000009245346.761789015210801.4293123",
                             "description"=>"ROBBERY - STREET - STRONG ARM",
                             "datetime"=>"6/21/2015 12:45 AM",
                             "lat"=>42.33173122781704,
                             "long"=>-83.05236304256091
                           },
                           {
                             "id"=>"14348466000009245377.122844295210785.94279965",
                             "description"=>"ASSAULT AND BATTERY/SIMPLE ASSAULT",
                             "datetime"=>"6/21/2015 12:30 AM",
                             "lat"=>42.33162838381696,
                             "long"=>-83.05263578056093
                           },
                           {
                             "id"=>"14348439000009243410.38284645211005.95698447",
                             "description"=>"LARCENY - PERSONAL PROPERTY FROM VEHICLE",
                             "datetime"=>"6/20/2015 11:45 PM",
                             "lat"=>42.33308945481707,
                             "long"=>-83.03496825455854
                           },
                           {
                             "id"=>"14348412000009244095.690455975211215.67461357",
                             "description"=>"ASSAULT AND BATTERY/SIMPLE ASSAULT",
                             "datetime"=>"6/20/2015 11:00 PM",
                             "lat"=>42.33448211681714,
                             "long"=>-83.04112447755939
                           }
                         ]
                         ```                         
