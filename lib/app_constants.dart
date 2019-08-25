import './model/Option.dart';

const String apiBaseUrl = 'https://icollect-api.algosystech.com/api/';

List<Option> activities = [
  Option(value: '', label: ''),
  Option(value: 'MoveToField', label: 'Move To Field'),
  Option(value: 'MoveToCalling', label: 'Move To Calling'),
  Option(value: 'CapturePTP', label: 'Capture PTP'),
  Option(value: 'MoveToSupervisor', label: 'Move To Supervisor'),
  Option(label: 'MarkAsSkip', value: 'Mark As Skip'),
  Option(value: 'MarkAsLegal', label: 'Mark As Legal'),
  Option(value: 'MarkNonContactable', label: 'Mark Non Contactable')
];

List<String> mmm = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec'
];
