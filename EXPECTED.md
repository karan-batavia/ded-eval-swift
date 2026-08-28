# Expected classification — swift

Nothing here carries a suppression signal: no `test` / `mock` / `sample` / `demo` / `fixture` in any path, class name, or comment. Rule 3 suppresses on those tokens, so a repo that looked like a fixture would score `None` everywhere and prove nothing.

## Data-access cases

| Case | Variable | Expected tag | Why |
|---|---|---|---|
| A | `"email_address"` in a SQL SELECT | ContactData.EmailAddress | field name (3a) |
| A | `"phone_number"` in a SQL SELECT | ContactData.PhoneNumber | field name (3a) |
| A | `"date_of_birth"` in a SQL SELECT | PersonalIdentification.DateofBirth | field name (3a) |
| A | `"created_at"` in a SQL SELECT | None | generic attribute (4) |
| B | `"firstName"` map/dict key read | PersonalIdentification.FirstName | field name (3a) |
| B | `"home_address"` map/dict key read | ContactData.Address | field name (3a) |
| B | `"companyId"` map/dict key read | None | organisation id (3) |
| C | `COL_EMAIL` constant used as a column name | ContactData.EmailAddress | field name, use site confirms (3a) |
| C | `CSS_EMAIL` same string used as a style class | None | names no field (3a) |
| C | `METRIC_NAME` same shape used as a counter name | None | names no field (3a) |
| D | `"meta.createdBy.firstName"` in a field mapping | PersonalIdentification.FirstName | field name (3a) |
| E | `"maria@example.com"` hardcoded constant | None | value, not a name (3) |
| F | `"Sending email to member"` log string | None | prose, not a name (3a) |
| G | `fieldList` / `columns` carrying names | None | carrier (3a) |
| H | infra + control flow | None | rule 3 |

## UI control cases

| Case | Variable | Expected tag | Why |
|---|---|---|---|
| I | `userName` control bound to the identity's user name | AccountData.AccountName | UI control (4.5) |
| I | `dobField` control, declared only | PersonalIdentification.DateofBirth | UI control, name alone (4.5) |
| I | `phoneField` control, declared only | ContactData.PhoneNumber | UI control, name alone (4.5) |
| I | `emailLabel` control showing a fixed caption | None | caption exception (4.5) |
| I | `screenTitle` control | None | names no personal attribute |

## Reading a run

- A row expecting a tag that returns `None` is a false negative — the rule did not fire.
- A row expecting `None` that returns a tag is a false positive — the rule fired too wide.
- The `C` rows are the sharpest: `COL_EMAIL` and `CSS_EMAIL` hold the identical string and must
  get opposite answers. Only the use site separates them.
