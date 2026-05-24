import '../import_helper.dart';

class AppTheme {
  static const Color background      = Color(0xFF020510);
    static const Color surfaceCard     = Color(0xFF080D1A);
      static const Color surfaceElevated = Color(0xFF0D1525);
        static const Color primary         = Color(0xFF00D4FF);
          static const Color secondaryAccent = Color(0xFF7C3AFF);
            static const Color accentPink      = Color(0xFFFF2D78);
              static const Color textForeground  = Color(0xFFE8F4F8);
                static const Color textMuted       = Color(0xFF3A5060);
                  static const Color border          = Color(0x1800D4FF);
                    static const Color borderBright    = Color(0x4000D4FF);
                      static const Color error           = Color(0xFFFF2D55);
                        static const Color success         = Color(0xFF00FFB3);

                          static const LinearGradient primaryGradient = LinearGradient(
                              colors: [primary, secondaryAccent],
                                  begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                        );
                                          static const LinearGradient cardGradient = LinearGradient(
                                              colors: [Color(0xFF0A1020), Color(0xFF060C18)],
                                                  begin: Alignment.topLeft,
                                                      end: Alignment.bottomRight,
                                                        );
                                                          static const LinearGradient glowGradient = LinearGradient(
                                                              colors: [Color(0x2200D4FF), Color(0x227C3AFF)],
                                                                  begin: Alignment.topLeft,
                                                                      end: Alignment.bottomRight,
                                                                        );
                                                                          static const BoxShadow neonGlow     = BoxShadow(color: Color(0x8000D4FF), blurRadius: 32, spreadRadius: -4);
                                                                            static const BoxShadow neonGlowSoft = BoxShadow(color: Color(0x3000D4FF), blurRadius: 20, spreadRadius: -2);
                                                                              static const BoxShadow purpleGlow   = BoxShadow(color: Color(0x607C3AFF), blurRadius: 28, spreadRadius: -4);
                                                                                static const BoxShadow cardShadow   = BoxShadow(color: Color(0xFF000000), blurRadius: 24, offset: Offset(0, 8));

                                                                                  static ThemeData get themeData => ThemeData(
                                                                                      brightness: Brightness.dark,
                                                                                          scaffoldBackgroundColor: background,
                                                                                              primaryColor: primary,
                                                                                                  cardColor: surfaceCard,
                                                                                                      fontFamily: GoogleFonts.sora().fontFamily,
                                                                                                          colorScheme: const ColorScheme.dark(primary: primary, secondary: secondaryAccent, surface: surfaceCard, error: error),
                                                                                                              appBarTheme: const AppBarTheme(backgroundColor: background, elevation: 0, centerTitle: true),
                                                                                                                  drawerTheme: const DrawerThemeData(backgroundColor: Color(0xFF030712)),
                                                                                                                      dividerTheme: const DividerThemeData(color: border, thickness: 1),
                                                                                                                        );
                                                                                                                        }

                                                                                                                        class GlassCard extends StatelessWidget {
                                                                                                                          final Widget child;
                                                                                                                            final EdgeInsetsGeometry? padding;
                                                                                                                              final BorderRadius? borderRadius;
                                                                                                                                final bool neon;
                                                                                                                                  final Color? borderColor;
                                                                                                                                    const GlassCard({super.key, required this.child, this.padding, this.borderRadius, this.neon = false, this.borderColor});

                                                                                                                                      @override
                                                                                                                                        Widget build(BuildContext context) => Container(
                                                                                                                                            padding: padding ?? const EdgeInsets.all(20),
                                                                                                                                                decoration: BoxDecoration(
                                                                                                                                                      gradient: AppTheme.cardGradient,
                                                                                                                                                            borderRadius: borderRadius ?? BorderRadius.circular(24),
                                                                                                                                                                  border: Border.all(color: borderColor ?? (neon ? AppTheme.borderBright : AppTheme.border), width: neon ? 1.5 : 1),
                                                                                                                                                                        boxShadow: neon ? [AppTheme.neonGlowSoft, AppTheme.cardShadow] : [AppTheme.cardShadow],
                                                                                                                                                                            ),
                                                                                                                                                                                child: child,
                                                                                                                                                                                  );
                                                                                                                                                                                  }

                                                                                                                                                                                  class GradientText extends StatelessWidget {
                                                                                                                                                                                    final String text;
                                                                                                                                                                                      final TextStyle? style;
                                                                                                                                                                                        final Gradient gradient;
                                                                                                                                                                                          const GradientText(this.text, {super.key, this.style, this.gradient = AppTheme.primaryGradient});

                                                                                                                                                                                            @override
                                                                                                                                                                                              Widget build(BuildContext context) => ShaderMask(
                                                                                                                                                                                                  blendMode: BlendMode.srcIn,
                                                                                                                                                                                                      shaderCallback: (b) => gradient.createShader(Rect.fromLTWH(0, 0, b.width, b.height)),
                                                                                                                                                                                                          child: Text(text, style: style),
                                                                                                                                                                                                            );
                                                                                                                                                                                                            }

                                                                                                                                                                                                            class NeonOrb extends StatelessWidget {
                                                                                                                                                                                                              final Color color;
                                                                                                                                                                                                                final double size;
                                                                                                                                                                                                                  final Alignment alignment;
                                                                                                                                                                                                                    final double opacity;
                                                                                                                                                                                                                      const NeonOrb({super.key, required this.color, required this.size, required this.alignment, this.opacity = 0.12});

                                                                                                                                                                                                                        @override
                                                                                                                                                                                                                          Widget build(BuildContext context) => Align(
                                                                                                                                                                                                                              alignment: alignment,
                                                                                                                                                                                                                                  child: Container(
                                                                                                                                                                                                                                        width: size, height: size,
                                                                                                                                                                                                                                              decoration: BoxDecoration(shape: BoxShape.circle, gradient: RadialGradient(colors: [color.withOpacity(opacity), Colors.transparent])),
                                                                                                                                                                                                                                                  ),
                                                                                                                                                                                                                                                    );
                                                                                                                                                                                                                                                    }

                                                                                                                                                                                                                                                    class ScanLine extends StatefulWidget {
                                                                                                                                                                                                                                                      const ScanLine({super.key});
                                                                                                                                                                                                                                                        @override
                                                                                                                                                                                                                                                          State<ScanLine> createState() => _ScanLineState();
                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                          class _ScanLineState extends State<ScanLine> with SingleTickerProviderStateMixin {
                                                                                                                                                                                                                                                            late AnimationController _ctrl;
                                                                                                                                                                                                                                                              late Animation<double> _anim;
                                                                                                                                                                                                                                                                @override
                                                                                                                                                                                                                                                                  void initState() {
                                                                                                                                                                                                                                                                      super.initState();
                                                                                                                                                                                                                                                                          _ctrl = AnimationController(vsync: this, duration: const Duration(seconds: 3))..repeat();
                                                                                                                                                                                                                                                                              _anim = Tween<double>(begin: -0.1, end: 1.1).animate(CurvedAnimation(parent: _ctrl, curve: Curves.linear));
                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                  @override
                                                                                                                                                                                                                                                                                    void dispose() { _ctrl.dispose(); super.dispose(); }
                                                                                                                                                                                                                                                                                      @override
                                                                                                                                                                                                                                                                                        Widget build(BuildContext context) => AnimatedBuilder(
                                                                                                                                                                                                                                                                                            animation: _anim,
                                                                                                                                                                                                                                                                                                builder: (_, __) => Align(
                                                                                                                                                                                                                                                                                                      alignment: Alignment(_anim.value * 2 - 1, _anim.value * 2 - 1),
                                                                                                                                                                                                                                                                                                            child: Container(width: double.infinity, height: 1,
                                                                                                                                                                                                                                                                                                                    decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.transparent, AppTheme.primary.withOpacity(0.15), Colors.transparent]))),
                                                                                                                                                                                                                                                                                                                        ),
                                                                                                                                                                                                                                                                                                                          );
                                                                                                                                                                                                                                                                                                                          }