count = [ARGV.shift.to_i, 1].max
puts "Starting Projection Server (#{count} processes)"
puts '=> Ctrl-C to shutdown projections server'
pids = []

count.times do |i|
  server_env = {'ROOT_DIR' => Dir.pwd, 'WORKER_COUNT' => count.to_s, 'WORKER_NUMBER' => i.to_s, 'DISCO_SYS' => 'projection', 'PARENT_PID' => Process.pid.to_s}
  pids << Process.spawn(server_env, "ruby #{File.expand_path '../../server', __FILE__}/projection_servers.rb")
end

trap(:INT) do
  pids.each do |pid|
    begin
      puts "#{pid} Projectionserver is interrupted!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
      Process.kill 9, pid
    rescue
      # do nothing
    end
  end
  puts
  exit(1)
end
Process.waitall
