class TesBluetoothDevice {
  final String? name;
  final String? address;
  final int type = 0;
  bool connected = false;

  TesBluetoothDevice(this.name, this.address);

  TesBluetoothDevice.fromMap(Map map)
      : name = map['name'],
        address = map['address'];

  Map<String, dynamic> toMap() => {
        'name': this.name,
        'address': this.address,
        'type': this.type,
        'connected': this.connected,
      };

  operator ==(Object other) {
    return other is TesBluetoothDevice && other.address == this.address;
  }

  @override
  int get hashCode => address.hashCode;
}
