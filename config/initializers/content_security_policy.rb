# Be sure to restart your server when you modify this file.

# Define an application-wide content security policy
# For further information see the following documentation
# https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy

Rails.application.config.content_security_policy do |policy|
  policy.default_src :self
  policy.img_src     :self, :https, :data
  policy.media_src   :self, :https, :data
  policy.script_src  :self, :unsafe_eval
  policy.script_src_attr :unsafe_inline
  policy.script_src_elem :self
  policy.style_src_elem :self, 'https://unpkg.com', :unsafe_inline
  policy.frame_ancestors :none
end

Rails.application.config.content_security_policy_nonce_generator = -> request { SecureRandom.base64(16) }
Rails.application.config.content_security_policy_nonce_directives = %w(script-src-elem)
