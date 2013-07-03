requires 'perl', '5.008001';
requires 'Nephia', '0.23';

on 'test' => sub {
    requires 'Test::More', '0.98';
    requires 'Capture::Tiny';
};

