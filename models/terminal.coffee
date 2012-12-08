terminal = {}
terminal.all = (callback) => 
  client.query 'SELECT * FROM na2_admin', (error, results, fields) =>
    if(error)
      console.log("데이터베이스 조회 실패: " + error)
      callback error, null

    results_for_return = []
    for result in results
      results_for_return.push {
        tcode: result['tcode'],
        tname: result['tname'],
        regdate: result['regdate']}

    callback null, results_for_return

terminal.arrive_region = (tcode, callback) =>
  client.query "SELECT * FROM na2_bang WHERE tcode = #{tcode}", (error, results, fields) =>
    if(error)
      console.log("데이터베이스 조회 실패: " + error)
      callback error, null

    results_for_return = []
    for result in results
      results_for_return.push {
        tcode: result['tcode'],
        tname: result['tname'],
        bang_code: result['bang_code'],
        bang_name: result['bang_name'],
        regdate: result['regdate']}

    callback null, results_for_return

terminal.arrive_terminal = (tcode, bang_code, callback) =>
  client.query "SELECT * FROM na2_heng WHERE tcode = #{tcode} AND bang_code = #{bang_code}", (error, results, fields) =>
    if(error)
      console.log("데이터베이스 조회 실패: " + error)
      callback error, null

    results_for_return = []
    for result in results
      results_for_return.push {
        tcode: result['tcode'],
        tname: result['tname'],
        bang_code: result['bang_code'],
        bang_name: result['bang_name'],
        heng_code: result['heng_code'],
        heng_name: result['heng_name'],
        regdate: result['regdate']}

    callback null, results_for_return

terminal.timetable = (tcode, bang_code, heng_code, wcode, callback) =>
  select_query = null
  if wcode isnt 'undefined' and wcode isnt null and wcode isnt ''
    select_query = "SELECT * FROM na2_bustime WHERE tcode = #{tcode} AND bang_code = #{bang_code} AND heng_code = #{heng_code}"
  else
    select_query = "SELECT * FROM na2_bustime WHERE tcode = #{tcode} AND bang_code = #{bang_code} AND heng_code = #{heng_code} AND wcode = #{wcode}"
  client.query select_query, (error, results, fields) =>
    if(error)
      console.log("데이터베이스 조회 실패: " + error)
      callback error, null

    results_for_return = []
    for result in results
      results_for_return.push {
        tcode: result['tcode'],
        tname: result['tname'],
        bang_code: result['bang_code'],
        bang_name: result['bang_name'],
        heng_code: result['heng_code'],
        heng_name: result['heng_name'],
        bustype: result['bustype'],
        wcode: result['wcode'],
        content: result['content'],
        regdate: result['regdate']}

    callback null, results_for_return

module.exports = terminal

# client.query 'USE na2', (error, results) =>
#   if(error)
#     console.log("데이터베이스 접속 실패: " + error)
#     return
#   console.log "na2 데이터베이스에 접속하였습니다."
#   getData client
 
# ClientReady = (client) =>
#   values = ['Leo', 'Lee', '만나서 반가워요!']
#   client.query "INSERT INTO MyTable SET firstname=?, lastname=?, message =?", values, (error, results) =>
#     if(error)
#       console.log("데이터베이스 입력 실패: " + error)
#       client.end()
#       return
#     console.log(results.affectedRows + "열 추가하였습니다.")
#     console.log("ID 추가하였습니다: " + results.insertId)
#   getData(client)
 
# getData = (client) =>
#   client.query "SELECT * FROM na2_admin", (error, results, fields) =>
#     if(error)
#       console.log("데이터베이스 조회 실패: " + error)
#       client.end()
#       return

#     if(results.length > 0)
#       firstResult = results[0]
#       console.log firstResult
#       # console.log('이름: ' + firstResult['firstname']);
#       # console.log('성: ' + firstResult['lastname']);
#       # console.log('메세지: ' + firstResult['message']);
#   client.end()
#   console.log("연결이 닫혔습니다.")
