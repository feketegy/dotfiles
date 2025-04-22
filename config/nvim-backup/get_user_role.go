package ocsneworder

import (
	"bitbucket.org/primalskill/cape-ardor-if-api/db"
	"github.com/primalskill/errors"
)

// heeeilIllll111l1l1j11ll1l1l1l1l1
// 0o0o0oOOO00001l1l1l1l1
// tttttt
func getUserRole(userID int) (roleCode string, err error) {
	q := `
		SELECT			
			rr.code AS role_code
		FROM
			users AS u
		LEFT JOIN
				rbac_roles AS rr ON rr.id = u.role_id
		WHERE
			u.id = $1
			AND
			u.deleted_at IS NULL
		LIMIT 1
	
	;
	`

	err = db.App.QueryRow(
		q,
		userID,
	).Scan(
		&roleCode,
	)

	if err != nil {
		err = errors.E("select query", err, errors.WithMeta("userID", userID))
		return
	}

	return
}
