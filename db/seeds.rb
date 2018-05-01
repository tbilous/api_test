user = User.create!([
  {name: "Vasyl Pupkine", email: "vp@com.com"}
])
ActionPermission.create!([
  {type: "ActionPermission", slug: "REBOOT"},
  {type: "ActionPermission", slug: "power off"}
])
ReadResourcePermission.create!([
  {type: "ReadResourcePermission", slug: "watch resource"}
])
WriteResourcePermission.create!([
  {type: "WriteResourcePermission", slug: "write attr"},
  {type: "WriteResourcePermission", slug: "write file"},
  {type: "WriteResourcePermission", slug: "write files"}
])
Role.create!([
 {name: "ABUSER"},
 {name: "moderator"}
])
UserRole.create!([
 {user_id: user.sample.id, role_id: 1},
 {user_id: user.sample.id, role_id: 2}
])
RolePermission.create!([
 {role_id: 1, permission_id: 1},
 {role_id: 1, permission_id: 3},
 {role_id: 2, permission_id: 4}
])
UserPermission.create!([
 {user_id: user.sample.id, permission_id: 1},
 {user_id: user.sample.id, permission_id: 2},
 {user_id: user.sample.id, permission_id: 6},
 {user_id: user.sample.id, permission_id: 4}
])
