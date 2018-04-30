module Permissionsable
  extend ActiveSupport::Concern

  included do
    # def add_role(r)
    #   roles << r
    # end

    def all_permissions?
      (permissions + user_role_permissions).map { |p| { type: p.display_type, slug: p.slug } }.uniq
    end

    def permissions?
      permissions.map { |p| { type: p.display_type, slug: p.slug } }.uniq
    end

    # def role_permissions?
    #   user_role_permissions.map { |p| { type: p.display_type, slug: p.slug } }.uniq
    #   # .select { |hash| hash[:type] == 'action' }
    # end

    def permission_granted?(p)
      permissions.include?(p) ? false : true
    end

    def add_permissions(p)
      error = false
      if permissions.include?(p)
        error = 'forbidden!'
      else
        permissions << p
      end
      send_response(error)
    end

    def remove_permissions(p)
      error = false
      if permissions.include?(p)
        permissions.delete(p.id)
      else
        error = 'forbidden!'
      end
      send_response(error)
    end

    def send_response(error)
      error ? [false, error] : [true, '']
    end
  end
end
