class FCFSModel {
  int id = 0;
  int atValue = 0;
  int oldAtValue = 0;
  int cpuBurstValue = 0;
  int oldcpuBurstValue = 0;
  int ioTime = 0;
  int cpu = 0;
  bool isFinish = false;
  static bool ioSwitch = false;
  static List<FCFSModel> tableListValue = [
    FCFSModel(0, 0, 0, 0, 0, 0, 0, false)
  ];
  FCFSModel(this.id, this.atValue, this.oldAtValue, this.cpuBurstValue,
      this.oldcpuBurstValue, this.ioTime, this.cpu, this.isFinish);
}
