{% for vhost in apache_vhosts %}
<VirtualHost *:80>
  ServerName {{ vhost.servername }}
{% if vhost.server_alias is defined %}
  ServerAlias {{ vhost.server_alias }}
{% endif %}
  DocumentRoot {{ vhost.documentroot }}
{% if vhost.serveradmin is defined %}
  ServerAdmin {{ vhost.serveradmin }}
{% endif %}
  <Directory "{{ vhost.documentroot }}">
    AllowOverride All
    Options -Indexes +FollowSymLinks
    Order allow,deny
    Allow from all
  </Directory>
</VirtualHost>
{% endfor %}
