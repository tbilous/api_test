module Permissionsable
  extend ActiveSupport::Concern

  included do
    def add_role(r)
      roles << r
    end

    def add_permissions(p)
      permissions << p
    end

    def all_permissions?
      (permissions + user_role_permissions).map { |p| { type: p.display_type, slug: p.slug } }.uniq
    end

    def permissions?
      permissions.map { |p| { type: p.display_type, slug: p.slug } }.uniq
    end

    def role_permissions?
      user_role_permissions.map { |p| { type: p.display_type, slug: p.slug } }.uniq
      # .select { |hash| hash[:type] == 'action' }
    end
  end
end
