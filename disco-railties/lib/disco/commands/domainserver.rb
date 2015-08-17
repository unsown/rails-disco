puts 'Starting Domain Command Server'
puts '=> Ctrl-C to shutdown domain server'

pid = Process.spawn({'ROOT_DIR' => Dir.pwd, 'PARENT_PID' => Process.pid.to_s}, "ruby #{File.expand_path '../../server', __FILE__}/domain_server.rb")

trap(:INT) do
  begin
    puts "#{pid} Domainserver is interrupted!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    Process.kill 9, pid
  rescue
    # do nothing
  end
  puts
  exit(1)
end
Process.waitall
