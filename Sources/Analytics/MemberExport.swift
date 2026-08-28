import Foundation

let colEmail = "email_address"
let cssEmail = "email_address"
let metricName = "phone_number"
let defaultSender = "maria@example.com"
let retryLimit = 3

func buildSelect(tableName: String, fieldList: [String]) -> String {
    return "SELECT \(fieldList.joined(separator: ",")) FROM \(tableName)"
}

func exportMembers(row: [String: String], el: Element, metrics: Metrics) -> String? {
    let sql = buildSelect(tableName: "member_profile",
                          fieldList: ["email_address", "phone_number", "date_of_birth", "created_at"])
    let email = row[colEmail]
    let home = row["home_address"]
    let org = row["companyId"]
    el.addClass(cssEmail)
    metrics.increment(metricName)
    NSLog("Sending email to member")
    return email
}
