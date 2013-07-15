use warnings;
use Test::More;

subtest 'around' => sub {
    subtest 'basic' => sub {
        package Nephia::DSLModifier::Test::Around;
        use File::Spec;
        use File::Basename 'dirname';
        use lib (
            File::Spec->rel2abs(File::Spec->catdir(dirname(__FILE__), 'lib'))
        );
        use Nephia plugins => ['Test::DSLModifier::Around'];
        main::like(base_dir, qr/^dir=/, 'modified');
    };
    subtest 'prototype' => sub {
        package Nephia::DSLModifier::Test::Around::Prototype;
        use File::Spec;
        use File::Basename 'dirname';
        use lib (
            File::Spec->rel2abs(File::Spec->catdir(dirname(__FILE__), 'lib'))
        );
        use Nephia plugins => ['Test::DSLModifier::Around::Prototype'];
        my $res = base_dir { 'dir: '.($_ ? $_ : '') };
        main::like($res, qr/^dir: /, 'modified');
    }
};

subtest 'before and after' => sub {
    package Nephia::DSLModifier::Test::BeforeAfter;
    use File::Spec;
    use File::Basename 'dirname';
    use Capture::Tiny 'capture';
    use lib ( 
        File::Spec->rel2abs(File::Spec->catdir(dirname(__FILE__), 'lib'))
    );
    use Nephia plugins => ['Test::DSLModifier::BeforeAfter'];
    my ($out, $err, $res) = capture { base_dir };
    main::is $out, "foobar", 'output before base_dir';
};

done_testing;
