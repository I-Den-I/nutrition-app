import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../../core/l10n/l10n.dart';
import '../../../core/settings/app_settings.dart';
import '../../../core/theme/app_tokens.dart';

/// First onboarding step. Profile & goals steps come in the MVP stage.
class LanguageScreen extends ConsumerWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final t = context.tokens;
    final current = ref.watch(settingsProvider).languageCode;
    final controller = ref.read(settingsProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Spacer(),
                  Text(
                    l10n.onboardingChooseLanguage,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.onboardingLanguageHint,
                    style: TextStyle(color: t.textSecondary),
                  ),
                  const SizedBox(height: 24),
                  for (final (code, name) in supportedLanguages)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: ListTile(
                        title: Text(name),
                        selected: code == current,
                        trailing: code == current
                            ? Icon(Icons.check, color: t.textPrimary)
                            : null,
                        onTap: () => controller.setLanguage(code),
                      ),
                    ),
                  const Spacer(flex: 2),
                  FilledButton(
                    onPressed: controller.completeOnboarding,
                    child: Text(l10n.actionContinue),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
