import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:genius_demo/core/utils/openWebview.dart';
import 'package:genius_demo/core/utils/text_style.dart';
import 'package:genius_demo/core/widgets/custom_scaffold.dart';
import 'package:genius_demo/core/widgets/shimmerEffect.dart';
import 'package:genius_demo/features/github/domain/entities/github_response.dart';
import 'package:genius_demo/features/github/presentation/cubit/github_cubit.dart';
import 'package:genius_demo/core/extensions/context_extension.dart';

class GithubScreen extends StatefulWidget {
  @override
  _GithubScreenState createState() => _GithubScreenState();
}

class _GithubScreenState extends State<GithubScreen> {
  @override
  void initState() {
    BlocProvider.of<GithubCubit>(context).getGitHubRepo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "GITHUB",
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: BlocBuilder<GithubCubit, GithubState>(
          builder: (context, state) {
            if (state is GithubInitial) {
              return ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: ShimmerEffect(
                      height: 200,
                    ),
                  );
                },
              );
            } else if (state is GithubLoading) {
              return ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: ShimmerEffect(
                      height: 200,
                    ),
                  );
                },
              );
            } else if (state is GithubLoaded) {
              return ListView.builder(
                itemCount: state.githubRepo.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  GitHubResponse git = state.githubRepo[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: context.theme.surface,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          onTap: () async => openWebview(context, git.htmlUrl),
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      child: CachedNetworkImage(
                                        imageUrl: git.owner.avatarUrl,
                                        placeholder: (context, url) => Center(
                                            child: ShimmerEffect(
                                          isCircular: true,
                                        )),
                                        errorWidget: (context, url, error) =>
                                            Center(
                                                child: ShimmerEffect(
                                          isCircular: true,
                                        )),
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Text(
                                        git.name,
                                        overflow: TextOverflow.ellipsis,
                                        style: StyleText.montMedium,
                                      ),
                                    )
                                  ],
                                ),
                                Divider(),
                                Text(
                                  git.fullName,
                                  style: StyleText.montBold,
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  git.description != null
                                      ? git.description
                                      : '[No Descriptions]',
                                  style: StyleText.montRegular
                                      .copyWith(color: Colors.grey),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 12,
                                          width: 12,
                                          decoration: BoxDecoration(
                                              color: Colors.redAccent,
                                              shape: BoxShape.circle),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          git.language != null
                                              ? git.language
                                              : 'XXXX',
                                          style: StyleText.montRegular
                                              .copyWith(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              FontAwesome.code_fork,
                                              size: 16,
                                              color: context.theme.textColor,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              git.forksCount.toString(),
                                              style: StyleText.montRegular
                                                  .copyWith(color: Colors.grey),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          decoration: BoxDecoration(
                                              color: Colors.yellow
                                                  .withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                size: 16,
                                                color: Colors.yellow,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                git.stargazersCount.toString(),
                                                style: StyleText.montRegular
                                                    .copyWith(
                                                        color: Colors.grey),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (state is GithubError) {
              return ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: ShimmerEffect(
                      height: 200,
                    ),
                  );
                },
              );
            } else {
              return ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: ShimmerEffect(
                      height: 200,
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
