import 'package:flutter/material.dart';

import '../../util/colors.dart';
import '../../util/extensions.dart';

class DateRangePickerOverlay extends StatefulWidget {
  final DateTime startDate;
  final DateTime endDate;
  final void Function(DateTime start, DateTime end) onConfirm;

  const DateRangePickerOverlay({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.onConfirm,
  });

  @override
  State<DateRangePickerOverlay> createState() => _DateRangePickerOverlayState();
}

class _DateRangePickerOverlayState extends State<DateRangePickerOverlay> {
  late DateTime _displayMonth;
  late DateTime _selectedStart;
  DateTime? _selectedEnd;

  static const List<String> _weekdays = ['일', '월', '화', '수', '목', '금', '토'];

  @override
  void initState() {
    super.initState();
    _selectedStart = widget.startDate;
    _selectedEnd = widget.endDate;
    _displayMonth = DateTime(widget.endDate.year, widget.endDate.month);
  }

  void _prevMonth() {
    setState(() {
      _displayMonth = DateTime(_displayMonth.year, _displayMonth.month - 1);
    });
  }

  void _nextMonth() {
    final now = DateTime.now();
    final next = DateTime(_displayMonth.year, _displayMonth.month + 1);
    if (next.isAfter(DateTime(now.year, now.month))) return;
    setState(() {
      _displayMonth = next;
    });
  }

  void _onDayTap(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    if (date.isAfter(today)) return;

    setState(() {
      if (_selectedEnd != null) {
        _selectedStart = date;
        _selectedEnd = null;
      } else {
        if (date.isBefore(_selectedStart)) {
          _selectedEnd = _selectedStart;
          _selectedStart = date;
        } else {
          _selectedEnd = date;
        }
      }
    });
  }

  bool get _isRangeExceeded =>
      _selectedEnd != null &&
      _selectedEnd!.difference(_selectedStart).inDays > 365;

  bool _isInRange(DateTime date) {
    if (_selectedEnd == null) return false;
    return date.isAfter(_selectedStart) && date.isBefore(_selectedEnd!);
  }

  bool _isStart(DateTime date) => _isSameDay(date, _selectedStart);

  bool _isEnd(DateTime date) =>
      _selectedEnd != null && _isSameDay(date, _selectedEnd!);

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(30),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildMonthHeader(),
          _buildWeekdayRow(),
          _buildDayGrid(),
          const SizedBox(height: 8),
          _buildConfirmButton(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildMonthHeader() {
    final now = DateTime.now();
    final isNextDisabled = _displayMonth.year == now.year &&
        _displayMonth.month == now.month;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: _prevMonth,
            icon: const Icon(Icons.chevron_left, color: Colors.black87),
          ),
          Text(
            '${_displayMonth.year}.${_displayMonth.month.toString().padLeft(2, '0')}',
            style: context.fillsaTypo.subtitle1,
          ),
          IconButton(
            onPressed: isNextDisabled ? null : _nextMonth,
            icon: Icon(
              Icons.chevron_right,
              color: isNextDisabled ? Colors.grey[300] : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeekdayRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: _weekdays.map((day) {
          return Expanded(
            child: Center(
              child: Text(
                day,
                style: context.fillsaTypo.body4.copyWith(color: grey500),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildDayGrid() {
    final firstDay = DateTime(_displayMonth.year, _displayMonth.month, 1);
    final lastDay = DateTime(_displayMonth.year, _displayMonth.month + 1, 0);
    final startOffset = firstDay.weekday % 7;
    final totalCells = startOffset + lastDay.day;
    final rows = (totalCells / 7).ceil();
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Column(
        children: List.generate(rows, (row) {
          return Row(
            children: List.generate(7, (col) {
              final index = row * 7 + col;
              final dayNum = index - startOffset + 1;
              if (dayNum < 1 || dayNum > lastDay.day) {
                return const Expanded(child: SizedBox(height: 40));
              }
              final date = DateTime(_displayMonth.year, _displayMonth.month, dayNum);
              final isToday = _isSameDay(date, today);
              final isFuture = date.isAfter(today);
              final isStart = _isStart(date);
              final isEnd = _isEnd(date);
              final inRange = _isInRange(date);

              return Expanded(
                child: GestureDetector(
                  onTap: isFuture ? null : () => _onDayTap(date),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: inRange ? purple01.withAlpha(30) : Colors.transparent,
                      borderRadius: BorderRadius.horizontal(
                        left: isStart ? const Radius.circular(20) : Radius.zero,
                        right: isEnd ? const Radius.circular(20) : Radius.zero,
                      ),
                    ),
                    child: Center(
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: (isStart || isEnd) ? purple01 : Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '$dayNum',
                            style: context.fillsaTypo.body4.copyWith(
                              color: isFuture
                                  ? grey300
                                  : (isStart || isEnd)
                                      ? Colors.white
                                      : isToday
                                          ? purple01
                                          : grey700,
                              fontWeight: (isStart || isEnd)
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          );
        }),
      ),
    );
  }

  Widget _buildConfirmButton() {
    final disabled = _selectedEnd == null || _isRangeExceeded;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          if (_isRangeExceeded)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                '최대 1년까지 선택할 수 있어요',
                style: context.fillsaTypo.body4.copyWith(color: Colors.redAccent),
              ),
            ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: disabled
                  ? null
                  : () => widget.onConfirm(_selectedStart, _selectedEnd!),
              style: ElevatedButton.styleFrom(
                backgroundColor: purple01,
                foregroundColor: Colors.white,
                disabledBackgroundColor: grey300,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text('확인', style: context.fillsaTypo.buttonMediumBold.copyWith(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
