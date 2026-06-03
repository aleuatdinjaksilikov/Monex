import 'package:monex/share/models/contact.dart';
import 'package:monex/share/models/currency.dart';
import 'package:monex/share/models/payment.dart';
import 'package:monex/share/models/transaction.dart';
import 'package:monex/share/models/transaction_status.dart';
import 'package:monex/share/models/transaction_type.dart';

class FakeData {
  FakeData._();

  // ─── Currencies ────────────────────────────────────────────
  static const List<Currency> currencies = [
    Currency.uzs,
  ];

  static Map<String, Currency> get currenciesMap => {
    for (final c in currencies) c.id: c,
  };

  // ─── Contacts ──────────────────────────────────────────────
  static final List<Contact> contacts = [
    Contact(
      id: 'contact-001',
      name: 'Азиз Каримов',
      phone: '+998901112233',
      createdAt: DateTime(2024, 2, 10),
    ),
    Contact(
      id: 'contact-002',
      name: 'Шахло Усмонова',
      phone: '+998902223344',
      createdAt: DateTime(2024, 2, 15),
    ),
    Contact(
      id: 'contact-003',
      name: 'Бобур Норматов',
      phone: '+998903334455',
      createdAt: DateTime(2024, 3, 1),
    ),
    Contact(
      id: 'contact-004',
      name: 'Дилноза Исмоилова',
      phone: '+998904445566',
      createdAt: DateTime(2024, 3, 5),
    ),
    Contact(
      id: 'contact-005',
      name: 'Тимур Жалолов',
      phone: '+998905556677',
      createdAt: DateTime(2024, 3, 20),
    ),
  ];

  static Map<String, Contact> get contactsMap => {
    for (final c in contacts) c.id: c,
  };

  // ─── Transactions ──────────────────────────────────────────
  static final List<Transaction> transactions = [
    // Азиз — мне должен (lent)
    Transaction(
      id: 'tx-001',
      contactId: 'contact-001',
      type: TransactionType.lent,
      amount: 500000,
      remaining: 500000,
      currencyId: Currency.uzs.id,
      description: 'Ноутбук MacBook Pro',
      status: TransactionStatus.active,
      createdAt: DateTime(2026, 4, 12),
    ),
    Transaction(
      id: 'tx-002',
      contactId: 'contact-001',
      type: TransactionType.lent,
      amount: 200000,
      remaining: 100000,
      currencyId: Currency.uzs.id,
      description: 'Обед в ресторане',
      status: TransactionStatus.partiallyPaid,
      createdAt: DateTime(2026, 3, 28),
    ),

    // Шахло — мне должна (lent)
    Transaction(
      id: 'tx-003',
      contactId: 'contact-002',
      type: TransactionType.lent,
      amount: 740000,
      remaining: 740000,
      currencyId: Currency.uzs.id,
      description: 'Аренда квартиры',
      status: TransactionStatus.active,
      createdAt: DateTime(2026, 4, 5),
    ),
    Transaction(
      id: 'tx-004',
      contactId: 'contact-002',
      type: TransactionType.lent,
      amount: 300000,
      remaining: 0,
      currencyId: Currency.uzs.id,
      description: 'Телефон',
      status: TransactionStatus.closed,
      createdAt: DateTime(2026, 2, 14),
    ),

    // Бобур — я должен (borrowed)
    Transaction(
      id: 'tx-005',
      contactId: 'contact-003',
      type: TransactionType.borrowed,
      amount: 380000,
      remaining: 380000,
      currencyId: Currency.uzs.id,
      description: 'Аренда офиса на март',
      status: TransactionStatus.active,
      createdAt: DateTime(2026, 4, 1),
    ),

    // Дилноза — все закрыты
    Transaction(
      id: 'tx-006',
      contactId: 'contact-004',
      type: TransactionType.lent,
      amount: 150000,
      remaining: 0,
      currencyId: Currency.uzs.id,
      description: 'Такси',
      status: TransactionStatus.closed,
      createdAt: DateTime(2026, 1, 20),
    ),
    Transaction(
      id: 'tx-007',
      contactId: 'contact-004',
      type: TransactionType.borrowed,
      amount: 250000,
      remaining: 0,
      currencyId: Currency.uzs.id,
      description: 'Продукты',
      status: TransactionStatus.closed,
      createdAt: DateTime(2026, 1, 10),
    ),

    // Тимур — мне должен (lent)
    Transaction(
      id: 'tx-008',
      contactId: 'contact-005',
      type: TransactionType.lent,
      amount: 200000,
      remaining: 200000,
      currencyId: Currency.uzs.id,
      description: 'Спортзал на месяц',
      status: TransactionStatus.active,
      createdAt: DateTime(2026, 4, 18),
    ),
  ];

  static Map<String, List<Transaction>> get transactionsByContact => {
    for (final contact in contacts)
      contact.id: transactions
          .where((t) => t.contactId == contact.id)
          .toList(),
  };

  // ─── Payments ──────────────────────────────────────────────
  static final List<Payment> payments = [
    // Азиз частично вернул tx-002
    Payment(
      id: 'pay-001',
      transactionId: 'tx-002',
      amount: 100000,
      note: 'Первая часть',
      paidAt: DateTime(2026, 4, 5),
    ),

    // Шахло полностью вернула tx-004
    Payment(
      id: 'pay-002',
      transactionId: 'tx-004',
      amount: 300000,
      note: 'Полный возврат',
      paidAt: DateTime(2026, 3, 1),
    ),

    // Дилноза — закрытые транзакции
    Payment(
      id: 'pay-003',
      transactionId: 'tx-006',
      amount: 150000,
      note: null,
      paidAt: DateTime(2026, 2, 10),
    ),
    Payment(
      id: 'pay-004',
      transactionId: 'tx-007',
      amount: 250000,
      note: null,
      paidAt: DateTime(2026, 2, 1),
    ),
  ];

  static Map<String, List<Payment>> get paymentsByTransaction => {
    for (final tx in transactions)
      tx.id: payments
          .where((p) => p.transactionId == tx.id)
          .toList(),
  };

  // ─── Helpers ───────────────────────────────────────────────

  // общий баланс: положительный = мне должны, отрицательный = я должен
  static double get totalBalance => transactions
      .where((t) => t.status != TransactionStatus.closed)
      .fold(0, (sum, t) => t.type == TransactionType.lent
      ? sum + t.remaining
      : sum - t.remaining);

  // сколько мне должны суммарно
  static double get totalLent => transactions
      .where((t) =>
  t.type == TransactionType.lent &&
      t.status != TransactionStatus.closed)
      .fold(0, (sum, t) => sum + t.remaining);

  // сколько я должен суммарно
  static double get totalBorrowed => transactions
      .where((t) =>
  t.type == TransactionType.borrowed &&
      t.status != TransactionStatus.closed)
      .fold(0, (sum, t) => sum + t.remaining);
}